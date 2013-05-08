activeListeners = {}

chrome.extension.onConnect.addListener (port)->
    port.onMessage.addListener (message)->
        if message[0] == 'renderhtml'
            selection = message[1]
            $('#content').html(selection)

        if message[0] == 'renderclipboard'
            result = ''
            $("#sandbox").show()
            sandbox = $('#sandbox').val('').select()
            if document.execCommand('paste')
                result = sandbox.val()
            console.log result
            sandbox.val('')
            $("#sandbox").hide()
            $('#content').html(result)


