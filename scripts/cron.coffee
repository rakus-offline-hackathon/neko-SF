# 定期処理をするオブジェクトを宣言
cronJob = require('cron').CronJob
child_process = require('child_process')


module.exports = (robot) ->

  # Crontabの設定方法と一緒 *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  new cronJob('0/30 * * * * *', () ->
    console.log "Hello World!"
    filename = 'img/猫.jpg'
    child_process.exec "curl -F file=@#{filename} -F channels=sf -F token=#{process.env.HUBOT_SLACK_TOKEN} https://slack.com/api/files.upload", (err, stdout, stderr) ->
      if err
        console.log(err)
    
  ).start()
