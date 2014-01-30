$ ->
  root = exports ? this
  
  audio = $("#audio")[0]

  isWebkitSpeechSupported = ->
    if document.createElement('input').webkitSpeech
      console.log('webkitSpeech Disable')
      $('#webkitSpeechStatus').text('対応していません↓↓')
    else
      console.log('webkitSpeech Enable')
      $('#webkitSpeechStatus').text('対応しています!')

  tamagoAction = (inputText) ->
    TMG.isStanby   = true
    TMG.actoinType = 'jump'
    audio.play()

  root.speechCangeEvent = (inputText) ->
    console.log 'speech -> ' + inputText
    tamagoAction(inputText)

  isWebkitSpeechSupported()
    
  customboxOption = {
    url:            '#modal'
    effect:         'fadein'
    overlayColor:   '#FFF'
    overlayOpacity: 1
    speed:          1000
    close:          ->
      $('#wrap').fadeIn(1000)
  }
    
  $.fn.custombox customboxOption