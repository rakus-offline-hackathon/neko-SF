#!/bin/bash

# write your slack token 
export HUBOT_SLACK_TOKEN=
export PORT=8080

export IMAGE_UPLOAD_USER_ID=
export IMAGE_CHANNEL_ID=
export API_TOKEN=

npm install

./bin/hubot --adapter \slack