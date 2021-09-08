package internal

import (
	"fmt"
	"net"

	"github.com/codingpot/pr12er/server/middlewares/healthserver"
	"github.com/codingpot/pr12er/server/middlewares/metrics"
	"github.com/codingpot/pr12er/server/pkg/env"
	"github.com/codingpot/pr12er/server/pkg/pr12er"
	"github.com/codingpot/pr12er/server/pkg/serv"
	grpc_logrus "github.com/grpc-ecosystem/go-grpc-middleware/logging/logrus"
	grpc_ctxtags "github.com/grpc-ecosystem/go-grpc-middleware/tags"
	grpc_prometheus "github.com/grpc-ecosystem/go-grpc-prometheus"
	log "github.com/sirupsen/logrus"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

// Application is the main entry point of this server.
type Application struct {
	config     *env.Config
	server     *serv.Server
	grpcServer *grpc.Server
	promServer *metrics.PromServer
}

func ProvideApplication(
	config *env.Config,
	server *serv.Server,
	grpcServer *grpc.Server,
	promServer *metrics.PromServer) *Application {
	return &Application{
		config:     config,
		server:     server,
		grpcServer: grpcServer,
		promServer: promServer,
	}
}

func (app Application) Run() error {
	log.WithFields(
		log.Fields{
			"ServicePort":    app.config.ServicePort,
			"GITHUB_API_KEY": app.config.GitHubAPIKey,
		}).Print("gRPC server is listening")
	lis, err := net.Listen("tcp", fmt.Sprintf(":%s", app.config.ServicePort))
	if err != nil {
		log.WithError(err).Fatalf("failed to listen")
	}

	pr12er.RegisterPr12ErServiceServer(app.grpcServer, app.server)
	healthserver.RegisterHealthServer(app.grpcServer)
	reflection.Register(app.grpcServer)

	// Start your http server for prometheus.
	go func() {
		app.promServer.Start()
	}()

	return app.grpcServer.Serve(lis)
}

func ProvideGRPCServer() *grpc.Server {
	logNewEntry := log.NewEntry(log.New())
	return grpc.NewServer(
		grpc.ChainUnaryInterceptor(
			grpc_ctxtags.UnaryServerInterceptor(grpc_ctxtags.WithFieldExtractor(grpc_ctxtags.CodeGenRequestFieldExtractor)),
			grpc_logrus.UnaryServerInterceptor(logNewEntry),
			grpc_prometheus.UnaryServerInterceptor,
		),
		grpc.ChainStreamInterceptor(
			grpc_ctxtags.StreamServerInterceptor(grpc_ctxtags.WithFieldExtractor(grpc_ctxtags.CodeGenRequestFieldExtractor)),
			grpc_logrus.StreamServerInterceptor(logNewEntry),
			grpc_prometheus.StreamServerInterceptor,
		),
	)
}
