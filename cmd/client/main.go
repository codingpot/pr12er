package main

import (
	"log"

	"golang.org/x/net/context"
	"google.golang.org/grpc"

	pb "pr12er/pkg/protos"
)

func main() {

	var conn *grpc.ClientConn
	conn, err := grpc.Dial(":9000", grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %s", err)
	}
	defer conn.Close()

	c := pb.NewPr12ErServiceClient(conn)

	response, err := c.GetHello(context.Background(), &pb.HelloRequest{})
	if err != nil {
		log.Fatalf("Error when calling SayHello: %s", err)
	}
	log.Printf("Response from server: %s", response.Body)

}
