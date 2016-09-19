# 定期処理をするオブジェクトを宣言
cronJob = require('cron').CronJob
child_process = require('child_process')
fs = require ('fs')

module.exports = (robot) ->

  # Crontabの設定方法と一緒 *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  new cronJob('0 0 */3 * * 1-5', () ->

    # TODO 動的になんとかしたい。
    array = ["1"..."16"]
    name = array[Math.floor( Math.random() * 16 )]

    # TODO 動的にできたらファイルパスをサーバー上に固定したい
    path = "img/" + name + ".jpg"

    child_process.exec "curl -F file=@#{path} -F channels=sf -F token=#{process.env.HUBOT_SLACK_TOKEN} https://slack.com/api/files.upload", (err, stdout, stderr) ->
      if err
        console.log(err)
    
  ).start()
