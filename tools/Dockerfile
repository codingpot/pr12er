FROM ubuntu:latest AS builder
RUN apt update && apt install -y git curl make tar gzip bash unzip gcc
WORKDIR /temp
# Set up ENV variable.
ENV PATH=$PATH:/temp/flutter/bin:/usr/local/go/bin:/root/.local/bin:/root/go/bin
# Install Flutter.
RUN git clone https://github.com/flutter/flutter.git -b stable
RUN flutter upgrade
RUN flutter doctor
# Install Go.
COPY --from=golang:1.16 /usr/local/go/ /usr/local/go/

# Install dependencies
WORKDIR /workspace
COPY ./client/pubspec.lock ./client/pubspec.yaml ./client/
COPY ./server ./server/
COPY ./dbctl ./dbctl/
COPY Makefile .

RUN make install
RUN cd dbctl && go mod download
RUN rm -rf client server Makefile dbctl

# Install golangci-lint.
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.40.1

ENV PATH=$PATH:/root/.pub-cache/bin

WORKDIR /workspace

CMD ["/bin/bash"]
