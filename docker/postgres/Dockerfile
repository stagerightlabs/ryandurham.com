FROM postgres:10-alpine

LABEL maintainer="Ryan Durham <ryan@stagerightlabs.com>"

# Install vim
RUN apk update && apk upgrade && apk add vim

# Copy psqlrc config to the postgres home directory
COPY --chown=postgres:postgres .psqlrc /var/lib/postgresql/

# Copy our init.sql into the container
# This will only be run if the persistence volume is empty
COPY --chown=postgres:postgres init.sql /docker-entrypoint-initdb.d/

WORKDIR /var/lib/postgresql
ENV PATH "$PATH:/var/lib/postgresql"
