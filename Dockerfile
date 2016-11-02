FROM node:6-slim

ARG VERSION=3.2.0 LABEL version=$VERSION
RUN npm install --global gitbook-cli &&\
	gitbook fetch ${VERSION} &&\
	npm cache clear &&\
	rm -rf /tmp/*

#WORKDIR /srv/gitbook
#VOLUME /srv/gitbook /srv/html
#EXPOSE 4000 35729 
#CMD /usr/local/bin/gitbook serve

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV NODE_ENV
COPY package.json /usr/src/app/
RUN npm install
COPY app /usr/src/app
CMD [ "npm", "start" ]

# app.js

#RUN apt-get install -y git && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

start server waiting for github webhook 
download repo from github
when a push occurs.
 then make a pull from repo, and exec  gitbook build . /srv/html
#### https://github.com/rvagg/github-webhook-handler
#### cli git o 
