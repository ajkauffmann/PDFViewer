window.addEventListener("message", function(event) {
    var data = event.data;

    if (typeof(window[data.func]) == "function") {
        window[data.func].call(null, data.message);
    }
});

window.addEventListener("webviewerloaded", function(event) {
    window.parent.postMessage({
        'func': 'pdfViewerReady',
        'message': ''
    }, "*");
});

function BCLoadDocument(data) {
    var content = data.content;
    if (data.type = 'base64') {
        content = base64ToUint8Array(content);
    };
    PDFViewerApplication.open(content).then(function() {
        raiseDocumentOpen();
    });
}

function base64ToUint8Array(base64) {
    var raw = atob(base64);
    var uint8Array = new Uint8Array(raw.length);
    for(var i = 0; i < raw.length; i++) {
        uint8Array[i] = raw.charCodeAt(i);
    }
    return uint8Array;
}

function raiseDocumentOpen() {
    window.parent.postMessage({
        'func': 'onDocumentOpen',
        'message': ''
    }, "*");
}
