FROM golang

WORKDIR /cinematix

COPY . .



RUN go mod tidy

EXPOSE 9090

CMD go run .