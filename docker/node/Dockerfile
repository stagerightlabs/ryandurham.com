FROM node:12-alpine

LABEL maintainer="Ryan Durham <ryan@stagerightlabs.com>"

ARG UID=1000

USER ${UID}

WORKDIR /var/app/rcd_umbrella/apps/rcd_web/assets

CMD npm run watch
