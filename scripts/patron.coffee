# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  patrona_cevaplar = ["Siz ne derseniz o!", "Görüşleriniz benim için bir emirdir!", "Derhal!"]

  robot.respond /@(\w+)/i, (msg) ->
    sender   = msg.message.user.name.toLowerCase()
    if sender == "ecylmz"
      msg.send msg.random patrona_cevaplar
