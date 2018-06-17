FROM golang:alpine AS builder

COPY . /go/src/github.com/goutamtadi1/concourse-container-structure-tests-resource
ENV CGO_ENABLED 0
COPY assets/ /assets
RUN go build -o /assets/check github.com/goutamtadi1/concourse-container-structure-tests-resource/cmd/check
RUN go get github.com/GoogleContainerTools/container-structure-test

