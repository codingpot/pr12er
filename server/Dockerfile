FROM golang:1.16-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o server ./cmd/server/main.go

FROM alpine:latest
RUN apk add ca-certificates

WORKDIR /app
COPY --from=builder /app/server /app/server

EXPOSE 9000

CMD ./server
