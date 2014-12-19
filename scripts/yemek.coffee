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

  corbalar = ["yayla", "mercimek", "domates", "ezogelin", "tavuk suyu"]
  salatalar = ["tavuk salatası", "ton balıklı salata", "akdeniz salata", "tavuklu akdeniz salata", "sezar salata", "bahçe salatası"]
  pideler = ["kapalı kıymalı", "kapalı peynirli", "kapalı kaşarlı sucuklu", "kapalı kaşarlı pastırmalı", "açık kaşar üstü sucuklu", "açık kuşbaşı üstü kaşar", "açık sucuklu", "açık kuşbaşılı", "açık peynirli"]
  yemekler = ["pide", "salata", "çorba"]
  yemek_cevaplari = ["Bence bugün bunu denemelisin: ", "Bugün bi çılgınlık yap ve bunu söyle: ", "Bir tane de bana söylemeyi unutma: ", "Senin canın bugün bunu çekiyor olmalı: "]
  corba_cevaplari = ["Sıcak sıcak iyi gider söyle bi ", "Sana bugünkü çorba tavsiyem şudur: ", "İşte favori çorban "]
  pide_cevaplari = ["Ofisi biraz kokutacaksın ama bu pide bi harika: ", "Yanında bir şeyler de içmeyi unutma derim: ", "Dün yediysen bugün de yeme ama yine de sen bilirsin, işte önerim: ", "Bugün bi çılgınlık yap ve bunu söyle: "]
  salata_cevaplari = ["Artık değişik salataları da denemelisin. Bugünkü tavsiyem: ", "Bugün de bunu yiyelim diyorum: ", "Belki de hep bunu yiyorsun ama bence bu çok güzel: "]

  robot.respond /bugün ne yesem/i, (msg) ->
    msg.send "#{msg.random yemek_cevaplari} #{msg.random yemekler}"
  robot.respond /hangi (.*)/i, (msg) ->
    yemek_tipi = msg.match[1]
    switch yemek_tipi
      when "pide"
        msg.reply "#{msg.random pide_cevaplari} #{msg.random pideler}"
      when "çorba"
        msg.send "#{msg.random corba_cevaplari} #{msg.random corbalar}"
      when "salata"
        msg.send "#{msg.random salata_cevaplari} #{msg.random salatalar}"
      else
        msg.send "Öyle bir yemek çeşidi mi varmış? Hiç haberim yok."

  # robot.hear /hangi pide/i, (msg) ->
  #   msg.send "#{msg.random pide_cevaplari} #{msg.random pideler}"
  # robot.hear /hangi çorba/i, (msg) ->
  #   msg.send "#{msg.random salata_cevaplari} #{msg.random salatalar}"
  # robot.hear /hangi salata/i, (msg) ->
  #   msg.send "#{msg.random corba_cevaplari} #{msg.random corbalar}"

  #
  # robot.respond /open the (.*) doors/i, (msg) ->
  #   doorType = msg.match[1]
  #   if doorType is "pod bay"
  #     msg.reply "I'm afraid I can't let you do that."
  #   else
  #     msg.reply "Opening #{doorType} doors"
  #
  # robot.hear /I like pie/i, (msg) ->
  #   msg.emote "makes a freshly baked pie"
  #
  # lulz = ['lol', 'rofl', 'lmao']
  #
  # robot.respond /lulz/i, (msg) ->
  #   msg.send msg.random lulz
  #
  # robot.topic (msg) ->
  #   msg.send "#{msg.message.text}? That's a Paddlin'"
  #
  #
  # enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
  # leaveReplies = ['Are you still there?', 'Target lost', 'Searching']
  #
  # robot.enter (msg) ->
  #   msg.send msg.random enterReplies
  # robot.leave (msg) ->
  #   msg.send msg.random leaveReplies
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (msg) ->
  #   unless answer?
  #     msg.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   msg.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (msg) ->
  #   setTimeout () ->
  #     msg.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (msg) ->
  #   if annoyIntervalId
  #     msg.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   msg.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     msg.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (msg) ->
  #   if annoyIntervalId
  #     msg.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     msg.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, msg) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if msg?
  #     msg.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (msg) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     msg.reply "I'm too fizzy.."
  #
  #   else
  #     msg.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (msg) ->
  #   robot.brain.set 'totalSodas', 0
  #   robot.respond 'zzzzz'
