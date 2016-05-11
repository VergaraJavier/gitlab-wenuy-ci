FROM node:6
MAINTAINER Javier Vergara <javier.vergara-at-wenuy.com>
RUN apt-get -q -y install npm

RUN curl -sL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y build-essential xvfb firefox google-chrome-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g web-component-tester bower
RUN Xvfb :10 -ac &
RUN export DISPLAY=:10
