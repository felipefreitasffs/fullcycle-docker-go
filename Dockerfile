FROM golang:alpine AS builder

WORKDIR $GOPATH/src/helloapp
COPY hello.go .
RUN GOOS=linux go build -ldflags="-s -w"  -o /go/app

FROM scratch

COPY --from=builder /go/app /go/app

CMD ["/go/app"]

