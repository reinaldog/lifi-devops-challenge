FROM golang:1.23-alpine

WORKDIR /app

COPY . .

RUN go mod download
RUN go build -o bird-api

EXPOSE 4201

CMD ["./bird-api"]
