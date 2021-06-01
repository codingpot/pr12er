package main

import (
	"log"

	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

func main() {
	var conn *grpc.ClientConn
	conn, err := grpc.Dial(":9000", grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %s", err)
	}
	defer conn.Close()

	c := pr12er.NewPr12ErServiceClient(conn)

	response, err := c.GetHello(context.Background(), &pr12er.HelloRequest{Body: "hi server!"})
	if err != nil {
		log.Panicf("Error when calling SayHello: %s", err)
	}
	log.Printf("Response from server: %s", response.Body)
}
