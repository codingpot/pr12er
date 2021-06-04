FROM golang:1.16.4-alpine3.13 AS builder

RUN apk --no-cache add ca-certificates && GRPC_HEALTH_PROBE_VERSION=v0.4.2 && \
  wget -qO/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
  chmod +x /bin/grpc_health_probe

ARG APP_VERSION

RUN apk add upx

WORKDIR /src/
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags "-w -s -X 'github.com/codingpot/pr12er/server.pkg.env.Version=${APP_VERSION}'" -o service cmd/server/main.go
RUN upx service

FROM gcr.io/distroless/static:nonroot

COPY --from=builder /src/service .
COPY --from=builder /bin/grpc_health_probe /bin/grpc_health_probe

ENTRYPOINT ["./service"]