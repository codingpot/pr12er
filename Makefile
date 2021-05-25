.PHONY: install gen.go gen.dart test.gen clean
.DEFAULT_GOAL := gen.all

PROTOC := $(shell which protoc)
PROTOC_GEN_GO := $(shell which protoc-gen-go))
PROTOC_VERSION := 3.17.0
PROTOC_RELEASE := https://github.com/protocolbuffers/protobuf/releases
PROTO_FILES := $(shell find . -name "*.proto" -type f)
UNAME := $(shell uname)
GOPATH := ${GOPATH}

install:
ifeq ($(PROTOC),)
ifeq ($(UNAME),Darwin)
	brew install protobuf
endif
ifeq ($(UNAME), Linux)
	curl -LO "$(PROTOC_RELEASE)/download/v$(PROTOC_VERSION)/protoc-$(PROTOC_VERSION)-linux-x86_64.zip" && \
	unzip protoc-$(PROTOC_VERSION)-linux-x86_64.zip -d $${HOME}/.local && \
	export PATH="$${PATH}:$${HOME}/.local/bin"
endif
endif
#ifeq ($(PROTOC_GEN_GO),)
	(cd server && go mod download && grep _ ./cmd/tools/tools.go | cut -d' ' -f2 | xargs go install)
#endif
	pub global activate protoc_plugin

gen.all: gen.go gen.dart

gen.go:
	protoc \
    --go_out=server \
    --go_opt=paths=import \
    --go-grpc_out=server \
    --go-grpc_opt=paths=import \
    $(PROTO_FILES)

gen.dart:
	mkdir -p ./client/lib/protos/ && \
		protoc --proto_path=server/pr12er/protos --dart_out=grpc:./client/lib/protos $(PROTO_FILES)


# This will fail if files are modified.
# This will ensure generated files are always up to date.
test.gen: gen.go gen.dart
	git update-index --refresh
	git diff-index --quiet HEAD --


test: test.gen test.go test.dart

test.go:
	cd server && go build -o server ./cmd/server && go build -o client ./cmd/client

test.dart:
	cd client && flutter build apk

clean:
	rm -rf ./client/lib/protos/
	rm -rf ./server/pkg/pr12er/
