$ ->
  root = exports ? this

  isWebkitSpeechSupported = ->
    if document.createElement('input').webkitSpeech
      console.log 'webkitSpeech Disable'
    else
      console.log 'webkitSpeech Enable'

  root.speechCangeEvent = (inputText) ->
    console.log 'speech'
    $('#tamagoVoice').text (inputText + '!')

  isWebkitSpeechSupported()