$ ->
  root = exports ? this
  
  audio = $("#audio")[0]

  isWebkitSpeechSupported = ->
    if document.createElement('input').webkitSpeech
      console.log 'webkitSpeech Disable'
    else
      console.log 'webkitSpeech Enable'

  tamagoAction = (inputText) ->
    $('#tamagoBody').removeClass('waiting').addClass('animation')
    $('#tamagoVoice').text('Hello!')
    audio.play()
    setTimeout ->
      $('#tamagoBody').removeClass('animation').addClass('waiting')
      $('#tamagoVoice').empty()
    , 1200

  root.speechCangeEvent = (inputText) ->
    console.log 'speech -> ' + inputText
    tamagoAction(inputText)

  isWebkitSpeechSupported()
  
  $('#voiceInput').click ->
    $('.circle').css('animation-play-state', 'paused')
    
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