//go:build wireinject
// +build wireinject

package internal

import (
	"github.com/codingpot/pr12er/server/internal/ghv3"
	"github.com/codingpot/pr12er/server/middlewares/metrics"
	"github.com/codingpot/pr12er/server/pkg/env"
	"github.com/codingpot/pr12er/server/pkg/handlers"
	"github.com/codingpot/pr12er/server/pkg/handlers/gh"
	"github.com/codingpot/pr12er/server/pkg/serv"
	"github.com/google/wire"
)

func CreateApplication() *Application {
	panic(wire.Build(
		ProvideApplication,
		env.ProvideEnvConfig,
		serv.ProvideServer,
		handlers.ProvideHandler,
		ghv3.ProvideGitHubService,
		wire.Bind(new(gh.GitHubService), new(*ghv3.GitHubV3)),
		ProvideGRPCServer,
		metrics.ProvidePrometheusServer,
	))
}
