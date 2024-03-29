# syntax = docker/dockerfile:experimental
# Build Container
FROM golang:1.19 as builder

ENV GO111MODULE on
ENV GOPRIVATE=github.com/latonaio
WORKDIR /go/src/github.com/latonaio

COPY go.mod .

RUN go mod download

COPY . .

RUN go build -o data-platform-api-organization-exconf-rmq-kube

# Runtime Container
FROM alpine:3.14
RUN apk add --no-cache libc6-compat
ENV SERVICE=data-platform-api-organization-exconf-rmq-kube \
    APP_DIR="${AION_HOME}/${POSITION}/${SERVICE}"

WORKDIR ${AION_HOME}

COPY --from=builder /go/src/github.com/latonaio/data-platform-api-organization-exconf-rmq-kube .

CMD ["./data-platform-api-organization-exconf-rmq-kube"]
