package main

import (
	"github.com/codingpot/pr12er/server/internal"
	log "github.com/sirupsen/logrus"
)

func main() {
	if err := internal.CreateApplication().Run(); err != nil {
		log.WithError(err).Panic("application failed to run")
	}
}
