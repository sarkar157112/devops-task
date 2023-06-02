#!/bin/bash

# Check if a version number was supplied, if not ask for one
if [ -z "$1" ]
then
  echo "No version number supplied."
  read -p 'Please provide a version number: ' version
else
  version=$1
fi

# nvm installation
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# load nvm into current shell
. "$HOME/.nvm/nvm.sh"

# install node with the specified version
nvm install $version
if [ $? -ne 0 ]
then
  echo "Node.js installation failed."
  exit 1
fi

# use and set default node version
nvm use $version
nvm alias default $version

# verify node and npm version
node -v
npm -v

# install pm2
npm install pm2@latest -g
if [ $? -ne 0 ]
then
  echo "PM2 installation failed."
  exit 1
fi

echo "Installation completed successfully."

