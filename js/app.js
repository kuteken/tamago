// Generated by CoffeeScript 1.6.3
(function() {
  $(function() {
    var audio, customboxOption, isWebkitSpeechSupported, root, tamagoAction;
    root = typeof exports !== "undefined" && exports !== null ? exports : this;
    audio = $("#audio")[0];
    isWebkitSpeechSupported = function() {
      if (document.createElement('input').webkitSpeech) {
        console.log('webkitSpeech Disable');
        return $('#webkitSpeechStatus').text('対応していません↓↓');
      } else {
        console.log('webkitSpeech Enable');
        return $('#webkitSpeechStatus').text('対応しています!');
      }
    };
    tamagoAction = function(inputText) {
      TMG.isStanby = true;
      TMG.actoinType = 'jump';
      return audio.play();
    };
    root.speechCangeEvent = function(inputText) {
      console.log('speech -> ' + inputText);
      return tamagoAction(inputText);
    };
    isWebkitSpeechSupported();
    customboxOption = {
      url: '#modal',
      effect: 'fadein',
      overlayColor: '#FFF',
      overlayOpacity: 1,
      speed: 1000,
      close: function() {
        return $('#wrap').fadeIn(1000);
      }
    };
    return $.fn.custombox(customboxOption);
  });

}).call(this);
