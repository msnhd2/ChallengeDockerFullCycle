FROM golang:1.19-alpine as build

WORKDIR /app

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o api hello.go

FROM scratch

WORKDIR /app
#Copiar o binário gerado no último estágio
COPY --from=build /app/api ./

EXPOSE 8080

CMD ["./api"]