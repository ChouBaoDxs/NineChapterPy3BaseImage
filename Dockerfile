FROM node:10

MAINTAINER dongxuesen

WORKDIR /code

COPY ./package20200227.json /code/package.json

RUN yarn install && \
    yarn cache clean
