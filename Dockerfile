FROM golang:1.12-alpine AS builder

WORKDIR /app
COPY main.go /app

RUN go run main.go

FROM scratch

WORKDIR /app
COPY --from=builder /app .

CMD ["/main"]
