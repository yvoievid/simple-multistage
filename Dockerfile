FROM golang:1.21
WORKDIR /src
COPY . .
RUN go build -o test-program ./main.go

FROM alpine:3.14
WORKDIR /small
COPY --from=0 /src/test-program ./small
CMD ["./small"]
