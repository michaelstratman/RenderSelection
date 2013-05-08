chrome.contextMenus.onClicked.addListener (info,tab)->
    chrome.tabs.create {"active": true, "url": chrome.extension.getURL('render.html')}, (tab)=>
        port = chrome.extension.connect({name: 'renderHTMl'})
        port.postMessage(['renderhtml', info.selectionText])

chrome.runtime.onInstalled.addListener ()->
    chrome.contextMenus.create {
        "title": "Render Selection as HTML"
        "contexts":["selection"]
        "id": "renderhtml"
    }