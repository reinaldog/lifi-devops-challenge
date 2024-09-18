FROM golang:1.23-alpine

WORKDIR /app

COPY . .

RUN go mod download
RUN go build -o bird-image-api

EXPOSE 4200

CMD ["./bird-image-api"]
