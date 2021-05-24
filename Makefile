.PHONY: install gen.go
.DEFAULT_GOAL := gen.go

PROTOC := $(shell which protoc)
PROTOC_GEN_GO := $(shell which protoc-gen-go))
PROTO_FILES := $(shell find . -name "*.proto" -type f)
UNAME := $(shell uname)
GOPATH := ${GOPATH}
install:
ifeq ($(PROTOC),)
ifeq ($(UNAME),Darwin)
	brew install protobuf
endif
ifeq ($(UNAME), Linux)
	sudo apt-get update && export DEBIAN_FRONTEND=noninteractive \
	&& sudo apt-get -y install --no-install-recommends libprotobuf-dev protobuf-compiler golang-goprotobuf-dev
endif
endif
#ifeq ($(PROTOC_GEN_GO),)
	go get -u github.com/golang/protobuf/protoc-gen-go
	go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26.0
	go get -u google.golang.org/grpc/cmd/protoc-gen-go-grpc
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1.0
#endif
	pub global activate protoc_plugin

gen.go: $(PROTO_FILES)
$(PROTO_FILES):
	@echo protoc : $@
	@protoc \
    -I ./ \
    -I $(GOPATH)/src \
    --proto_path=server/pr12er/protos \
    --go_out=server/pkg/protos \
    --go_opt=paths=source_relative \
    --go-grpc_out=server/pkg/protos \
    --go-grpc_opt=paths=source_relative \
    $@

gen.dart:
	mkdir -p ./client/lib/protos/ && \
		protoc --proto_path=server/pr12er/protos --dart_out=grpc:./client/lib/protos $(PROTO_FILES)


# This will fail if files are modified.
# This will ensure generated files are always up to date.
test.gen: gen.go gen.dart
	git update-index --refresh
	git diff-index --quiet HEAD --
