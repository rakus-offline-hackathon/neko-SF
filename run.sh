#!/bin/bash

# write your slack token 
export HUBOT_SLACK_TOKEN=
export PORT=8080

export IMAGE_UPLOAD_USER_ID=
export IMAGE_CHANNEL_ID=
export API_TOKEN=

npm install

forever start -c coffee node_modules/.bin/hubot --adapter \slack --uid \neko
