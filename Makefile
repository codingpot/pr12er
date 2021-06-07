.DEFAULT_GOAL := gen.all

PROTOC_VERSION := 3.17.2
PROTOC_RELEASE := https://github.com/protocolbuffers/protobuf/releases
PROTOC_URL := $(PROTOC_RELEASE)/download/v$(PROTOC_VERSION)/
PROTO_FILES := $(shell find server -name "*.proto" -type f)
PROTO_THIRDPARTY_FILES := $(shell find thirdparty -name "*.proto" -type f)
UNAME := $(shell uname)

PROTOC_ZIP_MACOS := protoc-$(PROTOC_VERSION)-osx-x86_64.zip
PROTOC_ZIP_LINUX := protoc-$(PROTOC_VERSION)-linux-x86_64.zip
PROTOC_ZIP_WINDOWS := protoc-$(PROTOC_VERSION)-win64.zip
ifeq ($(UNAME),Darwin)
	PROTOC_FULL_URL := $(PROTOC_URL)/$(PROTOC_ZIP_MACOS)
	PROTOC_FILE := $(PROTOC_ZIP_MACOS)
else ifeq ($(UNAME), Linux)
	PROTOC_FULL_URL := $(PROTOC_URL)/$(PROTOC_ZIP_LINUX)
	PROTOC_FILE := $(PROTOC_ZIP_LINUX)
else ifeq ($(UNAME), Windows)
	PROTOC_FULL_URL := $(PROTOC_URL)/$(PROTOC_ZIP_WINDOWS)
	PROTOC_FILE := $(PROTOC_ZIP_WINDOWS)
endif

DART_MOCK_FILES := $(shell find client -name "*.mocks.dart" -type f)

.PHONY: install
install:
	curl -OL $(PROTOC_FULL_URL)
	unzip -o $(PROTOC_FILE) -d $${HOME}/.local
	export PATH="$${PATH}:$${HOME}/.local/bin"
	rm -f protoc-*.zip
	(cd server && go mod download && grep _ ./cmd/tools/tools.go | cut -d' ' -f2 | sed 's/\r//' | xargs go install)
	pub global activate protoc_plugin

.PHONY: gen.all
gen.all: gen.go gen.dart

.PHONY: gen.go
gen.go:
	mkdir -p ./server/pkg/protos/
	protoc \
	--proto_path=server \
	--proto_path=thirdparty \
	--go_out=server \
	--go_opt=paths=source_relative \
	--go-grpc_out=server \
	--go-grpc_opt=paths=source_relative \
	$(PROTO_FILES)

.PHONY: gen.dart
gen.dart:
	mkdir -p ./client/lib/protos/
	protoc \
	--proto_path=server \
	--proto_path=thirdparty \
	--dart_out=grpc:./client/lib/protos \
	$(PROTO_FILES) $(PROTO_THIRDPARTY_FILES)

.PHONY: test
test: test.go test.dart

.PHONY: test.dart
test.dart: $(DART_MOCK_FILES)
	cd client && flutter analyze && flutter test

$(DART_MOCK_FILES): $(DART_MOCK_FILES:.mocks.dart=.dart)
	cd client && flutter pub run build_runner build

.PHONY: test.dart-e2e
test.dart-e2e:
	cd client && flutter drive --target=test_driver/app.dart

.PHONY: format.dart
format.dart:
	cd client && flutter format .
	make gen.dart

.PHONY: test.go
test.go: lint.go
	cd server && go test ./...

.PHONY: format.go
format.go:
	cd server && gci -w . && gofumpt -w -s .
	# regenerate as generated files should not be edited.
	make gen.all

.PHONY: lint.go
lint.go:
	cd server && golangci-lint run

.PHONY: clean
clean:
	rm -rf ./client/lib/protos
	rm -rf ./server/pkg/pr12er/*.pb.go