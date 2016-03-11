#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y build-essential nodejs curl git



curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.nvm/nvm.sh
nvm install node
nvm alias default node
sudo apt-get install git-all
cd /vagrant
#npm install -g webpack babel-cli

npm shrinkwrap --dev
echo "cd /vagrant" >> .bashrc


if [ ! -d "OrderExplorer" ]; then
#    git clone http://pgitlab.prd.dc2.beachbody.com/team_beachbody_ecom/OrderExplorer.git
  git clone https://github.com/danielwrobert/vagrant-react-webpack.git OrderExplorer
fi

cd OrderExplorer

echo "Installed All the Things!"