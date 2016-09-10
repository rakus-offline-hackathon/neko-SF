module.exports = (robot) ->

    robot.respond /hi/i, (res) ->
      res.send "how r u?"