codeunit 50300 PDFViewerMgt
{
    var
            PDFViewerUrlTxt: Label 'https://bcpdfviewer.z6.web.core.windows.net/web/viewer.html?file=', Locked = true;

    procedure GetPdfViewerUrl(): Text
    begin
        exit(PDFViewerUrlTxt);
    end;
}