FROM golang:1.14 as build
WORKDIR /go/src/app
COPY . .
RUN go build -v -o /app .

FROM gcr.io/distroless/base
COPY --from=build /app /app
CMD ["/app"]