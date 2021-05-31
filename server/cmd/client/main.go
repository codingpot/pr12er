package main

import (
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	log "github.com/sirupsen/logrus"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

func main() {
	var conn *grpc.ClientConn
	conn, err := grpc.Dial(":9000", grpc.WithInsecure())
	if err != nil {
		log.WithError(err).Fatalf("fail to connect")
	}
	defer conn.Close()

	c := pr12er.NewPr12ErServiceClient(conn)

	response, err := c.GetHello(context.Background(), &pr12er.HelloRequest{Body: "hi server!"})
	if err != nil {
		log.WithError(err).Panic("Error when calling SayHello")
	}
	log.Printf("Response from server: %s", response.Body)
}
