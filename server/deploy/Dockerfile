FROM golang:1.16.4-alpine3.13 AS builder

ARG APP_VERSION

RUN apk add upx

WORKDIR /src/
COPY ./server/go.mod .
COPY ./server/go.sum .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags "-w -s -X 'github.com/codingpot/pr12er/server.pkg.env.Version=${APP_VERSION}'" -o service server/cmd/server/main.go
RUN upx service

FROM gcr.io/distroless/static:nonroot

COPY --from=builder /src/service .

ENTRYPOINT ["./service"]