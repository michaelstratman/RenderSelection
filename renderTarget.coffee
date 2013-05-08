activeListeners = {}

chrome.extension.onConnect.addListener (port)->
    port.onMessage.addListener (message)->
        if message[0] == 'renderhtml'
            selection = message[1]
            document.body.innerHTML = selection


