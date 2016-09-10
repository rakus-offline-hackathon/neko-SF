module.exports = (robot) ->

    robot.respond /hi/i, (res) ->
      res.send "how r u?"
    
    robot.respond /neko/i, (res) ->
        url = 'https://api.photozou.jp/rest/search_public.json?keyword=neko'
        robot.http(url)
            .header('Accept','application/json')
            .get() (err,response,body) ->
                data = JSON.parse body
                data = data['info']['photo'][0]['image_url']
                res.send "#{data}"
