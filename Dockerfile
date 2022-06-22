# FROM alpine
FROM node:lts-alpine3.14

# Install dependencies
RUN echo -e "http://nl.alpinelinux.org/alpine/v3.5/main\nhttp://nl.alpinelinux.org/alpine/v3.5/community" > /etc/apk/repositories
RUN apk add sudo curl bash git
RUN npm install -g pm2

# Install filebrowser
RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

# Copy files/scripts
COPY config/filebrowser.json /.filebrowser.json
COPY config /config

RUN rm -rf /database.db && touch database.db
RUN filebrowser config init

# CMD ["/config/startup.sh"]