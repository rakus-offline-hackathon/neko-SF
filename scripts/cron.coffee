# 定期処理をするオブジェクトを宣言
cronJob = require('cron').CronJob
child_process = require('child_process')
fs = require ('fs')

module.exports = (robot) ->

  # Crontabの設定方法と一緒 *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  new cronJob('0 0 */3 * * 1-5', () ->
    token = process.env.API_TOKEN
    channel_id = process.env.IMAGE_CHANNEL_ID
    user_id = process.env.IMAGE_UPLOAD_USER_ID

    # apiを叩いて「指定したchannelに指定したユーザーが送信した画像の一覧情報」を取得する
    # TODO botのトークンがapi仕様上指定できないのでいまいち
    url = "https://slack.com/api/files.list?token=#{token}&user=#{user_id}&channel=#{channel_id}&types=images&pretty=1"
    request = robot.http(url).get()
    request (err, response, body) ->
      if err
        console.log(err)
      else
        # 結果からランダム指定
        datas = JSON.parse(body)['files']
        data = datas[ Math.floor(Math.random() * datas.length) ]
        imageUrl = data['url_private']

        # roomに送信
        robot.messageRoom(channel_id, imageUrl)

  ).start()

