#!/bin/bash

# add heroku repo
add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | apt-key add -
apt-get update

apt-get install -y apt-transport-https
apt-get install -y heroku
