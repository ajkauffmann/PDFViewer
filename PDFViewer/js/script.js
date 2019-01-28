var __ViewerFrame;
var __ViewerOrigin;

function InitializeControl(url) {
    __ViewerOrigin = (new URL(url)).origin;
    window.addEventListener("message", onMessage, false);
    var controlAddIn = document.getElementById('controlAddIn');
    controlAddIn.innerHTML = '<iframe id="viewer" style="border-style: none; margin: 0px; padding: 0px; height: 100%; width: 100%" allowFullScreen></iframe>'
    __ViewerFrame = document.getElementById('viewer');
    __ViewerFrame.src = url;
}

function onMessage(event) {
    if (event.origin !== __ViewerOrigin) {
        console.log('Blocked invalid cross-domain call');
        return;
    }

    var data = event.data;

    if (typeof(window[data.func]) == "function") {
        window[data.func].call(null, data.message);
    }
}

function pdfViewerReady(message) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnPdfViewerReady', null);
}

function LoadDocument(data) {
    __ViewerFrame.contentWindow.postMessage({
        'func': 'BCLoadDocument',
        'message': data
    }, __ViewerOrigin);
}
