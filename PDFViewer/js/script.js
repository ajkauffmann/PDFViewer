var __ViewerFrame;
var __ViewerDomain = "https://pdfviewer.kauffmann.nl";
var __ViewerPath = "/web/viewer.html";

function InitializeControl(controlId) {
    window.addEventListener("message", onMessage, false);
    var controlAddIn = document.getElementById(controlId);
    controlAddIn.innerHTML = '<iframe id="viewer" style="border-style: none; margin: 0px; padding: 0px; height: 100%; width: 100%" allowFullScreen></iframe>'
    __ViewerFrame = document.getElementById('viewer');
    __ViewerFrame.src = __ViewerDomain + __ViewerPath;
}

function onMessage(event) {
    if (event.origin !== __ViewerDomain) {
        console.log('Blocked invalid cross-domain call');
        return;
    }

    var data = event.data;

    if (typeof(window[data.func]) == "function") {
        window[data.func].call(null, data.message);
    }
}

function pdfViewerReady(message) {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ControlAddInReady', null);
}

function LoadDocument(data) {
    __ViewerFrame.contentWindow.postMessage({
        'func': 'BCLoadDocument',
        'message': data
    }, __ViewerDomain);
}
