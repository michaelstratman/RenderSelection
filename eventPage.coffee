chrome.contextMenus.onClicked.addListener (info,tab)->
    if info.menuItemId == 'renderselection'
        selection = info.selectionText
        chrome.tabs.create {"active": true, "url": chrome.extension.getURL('render.html')}, (tab)=>
            port = chrome.extension.connect({name: 'renderHTMl'})
            port.postMessage(['renderhtml', selection])

    else if info.menuItemId == 'renderclipboard'
        chrome.tabs.create {"active": true, "url": chrome.extension.getURL('render.html')}, (tab)=>
            port = chrome.extension.connect({name: 'renderHTMl'})
            port.postMessage(['renderclipboard'])
        

    

chrome.runtime.onInstalled.addListener ()->
    chrome.contextMenus.create {
        "title": "Render Selection as HTML"
        "contexts":["selection"]
        "id": "renderselection"
    }

    chrome.contextMenus.create {
        "title": "Render Clipboard as HTML"
        "contexts": ["page"]
        "id": "renderclipboard"
    }