controladdin PDFViewer
{
    StartupScript = 'js/startup.js';
    Scripts = 'js/script.js';

    /* MinimumHeight = 400;
    RequestedHeight = 400;
    MaximumHeight = 1000; */

    event ControlAddInReady();
    procedure LoadDocument(data: JsonObject);
}