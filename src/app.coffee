$ ->
  root = exports ? this

  isWebkitSpeechSupported = ->
    if document.createElement('input').webkitSpeech
      console.log 'webkitSpeech Disable'
    else
      console.log 'webkitSpeech Enable'

  tamagoAction = (inputText) ->
    $('#tamagoVoice').text (inputText + '!')
    $('#tamagoBody').removeClass('waiting').addClass('animation')
    setTimeout ->
      $('#tamagoBody').removeClass('animation').addClass('waiting')
      $('#tamagoVoice').empty()
    , 1200

  root.speechCangeEvent = (inputText) ->
    console.log 'speech -> ' + inputText
    tamagoAction(inputText)

  isWebkitSpeechSupported()
