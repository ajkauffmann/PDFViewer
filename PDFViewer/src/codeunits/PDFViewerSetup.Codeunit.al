codeunit 50302 PDFViewerSetup
{
    var
        PDFViewerUrlTxt: Label 'https://bcpdfviewer.z6.web.core.windows.net/web/viewer.html?file=', Locked = true;

    procedure GetPdfViewerUrl() Url: Text
    begin
        Url := PDFViewerUrlTxt;
    end;
}