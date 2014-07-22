cd /tmp

# try to remove the repo if it already exists
rm -rf docker-nodejs-webserver; true

git clone git@github.com:felippenardi/docker-nodejs-webserver.git

cd docker-nodejs-webserver

npm install

node .
