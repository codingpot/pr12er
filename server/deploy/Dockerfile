FROM golang:1.16-alpine AS builder

ENV GRPC_HEALTH_PROBE_VERSION v0.4.2

RUN set -eux; \
  apkArch="$(apk --print-arch)"; \
  case "$apkArch" in \
  'x86_64') \
  export GOARCH='amd64' GOOS='linux'; \
  ;; \
  'armhf') \
  export GOARCH='arm' GOARM='6' GOOS='linux'; \
  ;; \
  'armv7') \
  export GOARCH='arm' GOARM='7' GOOS='linux'; \
  ;; \
  'aarch64') \
  export GOARCH='arm64' GOOS='linux'; \
  ;; \
  'x86') \
  export GO386='softfloat' GOARCH='386' GOOS='linux'; \
  ;; \
  'ppc64le') \
  export GOARCH='ppc64le' GOOS='linux'; \
  ;; \
  's390x') \
  export GOARCH='s390x' GOOS='linux'; \
  ;; \
  *) echo >&2 "error: unsupported architecture '$apkArch' (likely packaging update needed)"; exit 1 ;; \
  esac; \
  \
  URL="https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-${GOOS}-${GOARCH}"; \
  wget -O /bin/grpc_health_probe "$URL"; \
  chmod +x /bin/grpc_health_probe

WORKDIR /src/
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -ldflags "-w -s" -o server cmd/server/main.go

FROM gcr.io/distroless/static:nonroot

COPY --from=builder /src/server .
COPY --from=builder /bin/grpc_health_probe /bin/grpc_health_probe

ENTRYPOINT ["./server"]