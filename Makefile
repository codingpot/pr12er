.PHONY: install gen.go gen.dart test.gen clean
.DEFAULT_GOAL := gen.all

PROTOC := $(shell which protoc)
PROTOC_GEN_GO := $(shell which protoc-gen-go)
PROTOC_VERSION := 3.17.0
PROTOC_RELEASE := https://github.com/protocolbuffers/protobuf/releases
PROTO_FILES := $(shell find . -name "*.proto" -type f)
UNAME := $(shell uname)
GOPATH := ${GOPATH}

PROTOC_ZIP_MACOS := protoc-$(PROTOC_VERSION)-osx-x86_64.zip
PROTOC_ZIP_LINUX := protoc-$(PROTOC_VERSION)-linux-x86_64.zip

install:
ifeq ($(PROTOC),)
ifeq ($(UNAME),Darwin)
	curl -OL "$(PROTOC_RELEASE)/download/v$(PROTOC_VERSION)/$(PROTOC_ZIP_MACOS)"
	unzip -o $(PROTOC_ZIP_MACOS) -d $${HOME}/.local && \
	export PATH="$${PATH}:$${HOME}/.local/bin"
	rm -f $PROTOC_ZIP
endif
ifeq ($(UNAME), Linux)
	curl -LO "$(PROTOC_RELEASE)/download/v$(PROTOC_VERSION)/$(PROTOC_ZIP_LINUX)" && \
	unzip $(PROTOC_ZIP_LINUX) -d $${HOME}/.local && \
	export PATH="$${PATH}:$${HOME}/.local/bin"
endif
endif
#ifeq ($(PROTOC_GEN_GO),)
	(cd server && go mod download && grep _ ./cmd/tools/tools.go | cut -d' ' -f2 | xargs go install)
#endif
	pub global activate protoc_plugin

gen.all: gen.go gen.dart

gen.go:
	mkdir -p ./server/pkg/protos/
	protoc \
    --proto_path=server \
    --go_out=server \
    --go_opt=paths=source_relative \
    --go-grpc_out=server \
    --go-grpc_opt=paths=source_relative \
    $(PROTO_FILES)

gen.dart:
	mkdir -p ./client/lib/protos/ && \
		protoc \
			--proto_path=server \
			--dart_out=grpc:./client/lib/protos \
			$(PROTO_FILES)

test: gen.all
	cd server && go test ./...
	cd client && flutter test

clean:
	rm -rf ./client/lib/protos
	rm -rf ./server/pkg/pr12er/*.pb.go
