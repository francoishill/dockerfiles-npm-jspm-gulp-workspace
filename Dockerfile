# Thanks to https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions

FROM ubuntu:14.04
MAINTAINER Francois Hill <francoishill11@gmail.com>

RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
RUN apt-get install -y git

RUN npm install -g npm
RUN npm install -g jspm
RUN npm install -g gulp

# `ni` script, make a shortcut command `ni` to call `npm install --no-bin-links`
RUN echo "#!/bin/sh" >> /usr/bin/ni
RUN echo "echo Starting with npm install --no-bin-links" >> /usr/bin/ni
RUN echo "npm install --no-bin-links" >> /usr/bin/ni
RUN echo "echo NPM INSTALL SUCCESS" >> /usr/bin/ni
RUN chmod +x /usr/bin/ni

# `ji` script, make a shortcut command `ji` to call `jspm install -y`
RUN echo "#!/bin/sh" >> /usr/bin/ji
RUN echo "echo Starting with jspm install -y" >> /usr/bin/ji
RUN echo "jspm install -y" >> /usr/bin/ji
RUN echo "echo JSPM INSTALL SUCCESS" >> /usr/bin/ji
RUN chmod +x /usr/bin/ji

WORKDIR /src
EXPOSE 80
EXPOSE 9000-9100
