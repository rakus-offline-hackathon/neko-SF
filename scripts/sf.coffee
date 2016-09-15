module.exports = (robot) ->

    robot.respond /hi/i, (res) ->
      res.send "how r u?"
    
    robot.respond /neko/i, (res) ->
        url = 'https://api.photozou.jp/rest/search_public.json?keyword=neko'
        robot.http(url)
            .header('Accept','application/json')
            .get() (err,response,body) ->
                datas = JSON.parse(body)['info']['photo']
                data = res.random(datas)
                res.send data['image_url']

