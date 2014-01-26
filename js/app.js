// Generated by CoffeeScript 1.6.3
(function() {
  $(function() {
    var isWebkitSpeechSupported, root, tamagoAction;
    root = typeof exports !== "undefined" && exports !== null ? exports : this;
    isWebkitSpeechSupported = function() {
      if (document.createElement('input').webkitSpeech) {
        return console.log('webkitSpeech Disable');
      } else {
        return console.log('webkitSpeech Enable');
      }
    };
    tamagoAction = function(inputText) {
      $('#tamagoVoice').text(inputText + '!');
      $('#tamagoBody').removeClass('waiting').addClass('animation');
      return setTimeout(function() {
        $('#tamagoBody').removeClass('animation').addClass('waiting');
        return $('#tamagoVoice').empty();
      }, 1200);
    };
    root.speechCangeEvent = function(inputText) {
      console.log('speech ->' + inputText);
      return tamagoAction(inputText);
    };
    return isWebkitSpeechSupported();
  });

}).call(this);
