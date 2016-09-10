# 定期処理をするオブジェクトを宣言
cronJob = require('cron').CronJob
child_process = require('child_process')
fs = require ('fs')


module.exports = (robot) ->

  # Crontabの設定方法と一緒 *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  new cronJob('0 */2 * * * *', () ->
    console.log "Hello World!"
    array = ["1", "2", "3"]
    name = array[Math.floor( Math.random() * 2 )]
    path = "img/" + name + ".jpg"

    child_process.exec "curl -F file=@#{path} -F channels=sf -F token=#{process.env.HUBOT_SLACK_TOKEN} https://slack.com/api/files.upload", (err, stdout, stderr) ->
      if err
        console.log(err)
    
  ).start()
