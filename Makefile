.DEFAULT_GOAL := gen.all

PROTOC_VERSION := 3.17.2
PROTOC_RELEASE := https://github.com/protocolbuffers/protobuf/releases
PROTOC_URL := $(PROTOC_RELEASE)/download/v$(PROTOC_VERSION)/
UNAME := $(shell uname)

PROTOC_ZIP_MACOS := protoc-$(PROTOC_VERSION)-osx-x86_64.zip
PROTOC_ZIP_LINUX := protoc-$(PROTOC_VERSION)-linux-x86_64.zip
PROTOC_ZIP_WINDOWS := protoc-$(PROTOC_VERSION)-win64.zip
ifeq ($(UNAME), Darwin)
	PROTOC_FULL_URL := $(PROTOC_URL)/$(PROTOC_ZIP_MACOS)
	PROTOC_FILE := $(PROTOC_ZIP_MACOS)
else ifeq ($(UNAME), Linux)
	PROTOC_FULL_URL := $(PROTOC_URL)/$(PROTOC_ZIP_LINUX)
	PROTOC_FILE := $(PROTOC_ZIP_LINUX)
else ifeq ($(UNAME), Windows)
	PROTOC_FULL_URL := $(PROTOC_URL)/$(PROTOC_ZIP_WINDOWS)
	PROTOC_FILE := $(PROTOC_ZIP_WINDOWS)
endif

# Mock 이 필요한 파일
DART_MOCK_SRCS := $(shell find client -name "*_with_mocks.dart" -type f)
DART_MOCK_TARGETS := $(DART_MOCK_SRCS:%_with_mocks.dart=%_with_mocks.mocks.dart)

BIN_INSTALL_DIR := $$HOME/.local/bin
BUF_VERSION := 0.43.2

.PHONY: install
install: install.buf
	curl -OL $(PROTOC_FULL_URL)
	unzip -o $(PROTOC_FILE) -d $(BIN_INSTALL_DIR)/../
	export PATH="$${PATH}:$(BIN_INSTALL_DIR)"
	rm -f protoc-*.zip
	make install.go
	pub global activate protoc_plugin

.PHONY: install.go
install.go:
	cd server && go mod download && grep _ ./cmd/tools/tools.go | cut -d' ' -f2 | sed 's/\r//' | xargs go install && go mod tidy

.PHONY: install.buf
install.buf:
	mkdir -p "$(BIN_INSTALL_DIR)"
	curl -sSL "https://github.com/bufbuild/buf/releases/download/v$(BUF_VERSION)/buf-$(shell uname -s)-$(shell uname -m)" -o "$(BIN_INSTALL_DIR)/buf"
	chmod +x "$(BIN_INSTALL_DIR)/buf"

.PHONY: uninstall.buf
uninstall.buf:
	rm -f $(BIN_INSTALL_DIR)/buf

.PHONY: gen.all
gen.all:
	buf generate

.PHONY: test
test: test.go test.dart

.PHONY: test.dart
test.dart: $(DART_MOCK_TARGETS)
	cd client && flutter analyze && flutter test

$(DART_MOCK_TARGETS): $(DART_MOCK_SRCS)
	cd client && flutter pub run build_runner build

.PHONY: test.dart-e2e
test.dart-e2e:
	cd client && flutter drive --target=test_driver/app.dart

.PHONY: format.dart
format.dart:
	cd client && flutter format .
	make gen.all

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
	find ./client/test/ -name *.mocks.dart -delete
