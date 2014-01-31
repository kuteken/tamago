root = exports ? this

root.TMG = {}
root.canvas
root.stage
root.exportRoot

$ ->
  root.init = ->
    canvas = document.getElementById("tamagoArea")
    exportRoot = new lib.tamago()

    stage = new createjs.Stage(canvas)
    stage.addChild(exportRoot)
    stage.update()

    createjs.Ticker.setFPS(lib.properties.fps)
    createjs.Ticker.addEventListener("tick", stage)

  isWebkitSpeechSupported = ->
    if document.createElement('input').webkitSpeech == undefined
      $('#webkitSpeechStatus').text('対応していません↓↓')
    else
      $('#webkitSpeechStatus').text('対応しています!')

  root.speechCangeEvent = (inputText) ->
    console.log 'speech -> ' + inputText
    tamagoAction(inputText)

  tamagoAction = (inputText) ->
    loveWords  = /好|愛|すき|スキ|ラブ|love/
    happyWords = /楽|笑|喜|嬉|たのしい|うれしい|おはよう|こんにちは|こんばんは/
    switch true
      when inputText.match(loveWords)  != null then actionTAMAGO 'love'
      when inputText.match(happyWords) != null then actionTAMAGO 'standup'
      else
        if Math.floor(Math.random() * 2)
          actionTAMAGO 'shock'
        else
          actionTAMAGO 'stay'

  actionTAMAGO = (type) ->
    console.log 'actionType-> ' + type
    root.TMG.isStanby = true
    root.TMG.actionType = type

  root.init()
  isWebkitSpeechSupported()

  customboxOption = {
    url           : '#modal'
    effect        : 'fadein'
    overlayColor  : '#FFF'
    overlayOpacity: 1
    speed         : 1000
    close         : ->
      $('#wrap').fadeIn(1000)
  }

  $.fn.custombox customboxOption