# DOCKER-VERSION 0.10.0

FROM ubuntu:13.10

RUN apt-get update
RUN apt-get install -y wget

# Install Node
RUN   \
  cd /opt && \
  wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz && \
  tar -xzf node-v0.10.28-linux-x64.tar.gz && \
  mv node-v0.10.28-linux-x64 node && \
  cd /usr/local/bin && \
  ln -s /opt/node/bin/* . && \
  rm -f /opt/node-v0.10.28-linux-x64.tar.gz

# Set the working directory
WORKDIR   /src

RUN npm install

CMD ["/bin/bash"]
