FROM golang:alpine AS builder

WORKDIR /build

COPY go.mod .
COPY .env .
COPY main.go .

RUN go mod download
RUN go mod tidy
RUN GOOS=linux go build -o go-app main.go

FROM alpine

WORKDIR /build

COPY --from=builder /build/ /build/

CMD ["./go-app"]