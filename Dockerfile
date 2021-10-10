###################
### Build Stage ###
###################
FROM golang:1.17 AS build

WORKDIR /usr/src/app

COPY . .

RUN go build

###################
### Final Stage ###
###################
FROM scratch

COPY --from=build /usr/src/app/desafio-go /

CMD ["/desafio-go"]