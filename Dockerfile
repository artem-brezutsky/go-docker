FROM golang:alpine AS builder

WORKDIR /build

COPY go.mod .
COPY .env .
COPY main.go .

RUN go mod download
RUN go mod tidy
RUN GOOS=linux go build -o hello main.go

CMD ["./hello"]