FROM node:9
# name me as 'frontend'

WORKDIR /app/web

ADD web .
RUN yarn && yarn build


FROM golang:alpine
# name me as 'backend'

RUN apk add git
WORKDIR  /go/src/github.com/agentmilindu/web-api

ADD src .
RUN go get ./... \
&& go install github.com/agentmilindu/web-api


FROM nginx:alpine

COPY run.sh .
RUN chmod +x run.sh
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Copy the '/app/web/build' from 'frontend'  to '/usr/share/nginx/html'
# Copy the '/go/bin/web-api' frmo backend' to '/opt/app/api'

CMD ./run.sh
