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
  icecek_cevaplari = ["Çaya ne dersin?", "Kahve?", "Su!", "Ben de bilemedim :("]

  robot.hear /ne yesem/i, (msg) ->
    msg.reply "#{msg.random yemek_cevaplari} #{msg.random yemekler}"
  robot.hear /ne içsem/i, (msg) ->
    msg.reply msg.random icecek_cevaplari
  robot.hear /hangi (.*)/i, (msg) ->
    yemek_tipi = msg.match[1]
    switch yemek_tipi
      when "pide"
        msg.reply "#{msg.random pide_cevaplari} #{msg.random pideler}"
      when "çorba"
        msg.reply "#{msg.random corba_cevaplari} #{msg.random corbalar}"
      when "salata"
        msg.reply "#{msg.random salata_cevaplari} #{msg.random salatalar}"
      else
        msg.reply "Bilemedim ben onu"
