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

  adamlar_yapmis = ["Adamlar çalışıyor sen hala...", "Onlar ADAM ADAM", "Vay arkadaş!", "Nereden de akıllarına geliyor anlamıyorum...", "Bu daha önceden benim de aklıma gelmişti aslında", "Hmmmmmm...."]
  super_cevaplar = ["Gerçekten de süper birşeymiş.", "Hmm"]

  robot.hear /adamlar yapmış/i, (msg) ->
    msg.send msg.random adamlar_yapmis
  robot.hear /süper/i, (msg) ->
    msg.send msg.random super_cevaplar
