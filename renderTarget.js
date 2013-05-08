// Generated by CoffeeScript 1.4.0
(function() {
  var activeListeners;

  activeListeners = {};

  chrome.extension.onConnect.addListener(function(port) {
    return port.onMessage.addListener(function(message) {
      var result, sandbox, selection;
      if (message[0] === 'renderhtml') {
        selection = message[1];
        $('#content').html(selection);
      }
      if (message[0] === 'renderclipboard') {
        result = '';
        $("#sandbox").show();
        sandbox = $('#sandbox').val('').select();
        if (document.execCommand('paste')) {
          result = sandbox.val();
        }
        console.log(result);
        sandbox.val('');
        $("#sandbox").hide();
        return $('#content').html(result);
      }
    });
  });

}).call(this);
