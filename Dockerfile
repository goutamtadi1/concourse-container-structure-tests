FROM golang:alpine AS builder

COPY . /go/src/github.com/goutamtadi1/concourse-container-structure-tests-resource
ENV CGO_ENABLED 0
COPY assets/ /assets
RUN go build -o /assets/check github.com/goutamtadi1/concourse-container-structure-tests-resource/cmd/check
RUN cp /go/src/github.com/goutamtadi1/concourse-container-structure-tests-resource/container-structure-test-linux-amd64 /assets/container-structure-test

FROM alpine:edge AS resource
RUN apk --no-cache add bash docker jq
COPY --from=builder /assets /opt/resource
RUN mv /opt/resource/container-structure-test /usr/local/bin/container-structure-test && \
    chmod +x /usr/local/bin/container-structure-test

FROM resource
