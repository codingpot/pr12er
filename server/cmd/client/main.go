package main

import (
	"flag"
	"os"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	log "github.com/sirupsen/logrus"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/protobuf/encoding/prototext"
)

func main() {
	grpcReq := flag.String("grpcCmd", "", "Test specified GRPC request only, or test all the GRPC requests")
	flag.Parse()

	var conn *grpc.ClientConn
	conn, err := grpc.Dial(":9000", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.WithError(err).Panic("fail to connect")
	}
	defer conn.Close()
	c := pr12er.NewPr12ErServiceClient(conn)

	if *grpcReq != "video" {
		resp, err := c.GetHello(context.Background(), &pr12er.HelloRequest{Body: "hi server!"})
		if err != nil {
			log.WithError(err).Panic("Error when calling SayHello")
		}
		log.Printf("Response from server: %s", resp.Body)
	}

	if *grpcReq != "hello" {
		resp, err := c.GetVideos(context.Background(), &pr12er.GetVideosRequest{})
		if err != nil {
			log.WithError(err).Fatal("Error when calling SayHello")
		}
		log.Printf("Response from server. Total %d Video(s)", len(resp.Videos))

		respVideosStr := prototext.Format(resp.ProtoReflect().Interface())
		if err := os.WriteFile("pr12_getvideos.pbtxt", []byte(respVideosStr), 0o600); err != nil {
			log.WithError(err).Fatal("Error on writing file pr12_getvideos.pbtxt")
		}
	}
}
