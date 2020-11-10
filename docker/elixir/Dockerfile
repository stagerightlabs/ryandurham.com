FROM elixir:1.11-alpine

LABEL maintainer="Ryan Durham <ryan@stagerightlabs.com>"

# Establish a non-root user with uid 1000
ARG NAME=ryan
ENV NAME ${NAME}
RUN adduser -s /bin/sh -D -u 1000 -g '' ${NAME} ${NAME}

# Update the default alpine packages
RUN apk update && apk upgrade && apk --no-cache --update add \
    inotify-tools \
    make \
    g++ \
    wget

# Switch to the non-root user
USER ${NAME}

WORKDIR /var/app

# Set up our Elixir / Phoenix environment
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new 1.4.10 --force

CMD mix phx.server

EXPOSE 4000
