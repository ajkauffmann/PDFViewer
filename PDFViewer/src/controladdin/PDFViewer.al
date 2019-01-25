controladdin PDFViewer
{
    StartupScript = 'js/startup.js';
    Scripts = 'js/script.js';

    /* MinimumHeight = 400;
    RequestedHeight = 400;
    MaximumHeight = 1000; */

    event OnControlAddInReady();
    event OnPdfViewerReady();
    procedure InitializeControl(url: Text);
    procedure LoadDocument(data: JsonObject);
}