FROM golang:alpine as builder
WORKDIR /app
COPY . .
RUN go build -ldflags="-s -w" -o main .

FROM scratch
COPY --from=builder /app/main /main

CMD ["/main"]