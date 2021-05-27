FROM golang:alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

# Build the Go app
RUN go build -o server cmd/server/main.go

# Start fresh from a smaller image
FROM alpine:latest
RUN apk add ca-certificates

COPY --from=builder /app/server /app/server

# This container exposes port 8080 to the outside world
EXPOSE 9000

WORKDIR /app

# Run the binary program produced by `go install`
CMD ["./server"]
