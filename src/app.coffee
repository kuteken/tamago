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
    if document.createElement('input').webkitSpeech
      console.log('webkitSpeech Disable')
      $('#webkitSpeechStatus').text('対応していません↓↓')
    else
      console.log('webkitSpeech Enable')
      $('#webkitSpeechStatus').text('対応しています!')

  root.speechCangeEvent = (inputText) ->
    console.log 'speech -> ' + inputText
    tamagoAction(inputText)

  tamagoAction = (inputText) ->
    console.log inputText
    switch true
      when inputText.indexOf('ジャンプ') >= 0 then actionTAMAGO 'jump'
      when inputText.indexOf('ショック') >= 0 then actionTAMAGO 'shock'
      else actionTAMAGO 'waiting'

  actionTAMAGO = (type) ->
    console.log type
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