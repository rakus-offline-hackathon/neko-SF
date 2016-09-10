#!/bin/bash

export HUBOT_SLACK_TOKEN=xoxb-78277315478-25ieN4STRTxBCtWdk8q5UrlS
export PORT=8080

npm install

./bin/hubot --adapter \slack

# forever start -c coffee node_modules/.bin/hubot --adapter \slack