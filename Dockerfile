FROM node:9 AS frontend

WORKDIR /app/web

ADD web .
RUN yarn && yarn build


FROM golang:alpine AS backend

RUN apk add git
WORKDIR  /go/src/github.com/agentmilindu/web-api

ADD src .
RUN go get ./... \
&& go install github.com/agentmilindu/web-api


FROM nginx:alpine

COPY run.sh .
RUN chmod +x run.sh
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=frontend /app/web/build /usr/share/nginx/html
COPY --from=backend /go/bin/web-api /opt/app/api

CMD ./run.sh
