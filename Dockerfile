FROM golang:1.19

WORKDIR /usr/src/app

COPY webapp .
RUN go mod download && go mod verify && env GOOS=linux GOARCH=amd64 go build -v -o /usr/local/bin/webapp ./...

EXPOSE 80

CMD ["webapp"]