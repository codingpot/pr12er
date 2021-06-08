FROM golang:1.16-alpine AS builder

RUN apk --no-cache add ca-certificates && GRPC_HEALTH_PROBE_VERSION=v0.4.2 && \
  wget -qO/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
  chmod +x /bin/grpc_health_probe

RUN apk add upx

WORKDIR /src/
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-w -s" -o server cmd/server/main.go
RUN upx server

FROM gcr.io/distroless/static:nonroot

COPY --from=builder /src/server .
COPY --from=builder /bin/grpc_health_probe /bin/grpc_health_probe

ENTRYPOINT ["./server"]