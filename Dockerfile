# DOCKER-VERSION 0.10.0
FROM ubuntu:13.10

RUN apt-get update
RUN apt-get install -y libfreetype6 libfontconfig libreadline-dev wget tar bzip2 vim git python

# Define volume that will be mounted
VOLUME ["/src"]

# Install Node
RUN   \
  cd /opt && \
  wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz && \
  tar -xzf node-v0.10.28-linux-x64.tar.gz && \
  mv node-v0.10.28-linux-x64 node && \
  cd /usr/local/bin && \
  ln -s /opt/node/bin/* . && \
  rm -f /opt/node-v0.10.28-linux-x64.tar.gz

# Install PhantomJS
RUN   \
  cd /opt && \
  wget --no-check-certificate https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 && \
  tar xjf phantomjs-1.9.7-linux-x86_64.tar.bz2 && \
  mv phantomjs-1.9.7-linux-x86_64 phantomjs && \
  cd /usr/local/bin && \
  ln -s /opt/phantomjs/bin/* . && \
  rm -f /opt/phantomjs-1.9.7-linux-x86_64.tar.bz2


# Make Docker use a nonroot user
RUN useradd -ms /bin/bash node
RUN chown -R node /src /opt /usr
ENV HOME /home/node
USER node

# Set the working directory
WORKDIR   /src

# Install NPM Tools
RUN npm install -g yo
RUN npm install -g generator-angular
RUN npm install -g casperjs

CMD /bin/bash
