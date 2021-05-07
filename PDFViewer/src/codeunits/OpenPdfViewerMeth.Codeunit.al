codeunit 50301 OpenPdfViewerMeth
{
    procedure OpenPdfViewer(RecordVariant: Variant; FieldNo: Integer; Popup: Boolean)
    var
        PDFViewerBuffer: Record PDFViewerBuffer;
    begin
        SetPDFViewerBufferFilters(RecordVariant, FieldNo, PDFViewerBuffer);
        if Popup then
            OpenPopupPage(PDFViewerBuffer)
        else
            OpenPage(PDFViewerBuffer);
    end;

    local procedure OpenPage(var PDFViewerBuffer: Record PDFViewerBuffer)
    var
        PDFViewer: Page PDFViewer;
    begin
        PDFViewer.SetTableView(PDFViewerBuffer);
        PDFViewer.Run();
    end;

    local procedure OpenPopupPage(var PDFViewerBuffer: Record PDFViewerBuffer)
    var
        Url: Text;
    begin
        Url := GetUrl(CurrentClientType, CompanyName, ObjectType::Page, Page::PDFViewer, PDFViewerBuffer, true);
        Url := Url + '&showheader=0&target="_blank"';
        Hyperlink(Url);
    end;

    local procedure SetPDFViewerBufferFilters(RecordVariant: Variant; FieldNo: Integer; var PDFViewerBuffer: Record PDFViewerBuffer)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(RecordVariant);
        PDFViewerBuffer.Reset();
        PDFViewerBuffer.SetRange(SourceTableId, RecRef.Number);
        PDFViewerBuffer.SetRange(SourceId, RecRef.Field(RecRef.SystemIdNo).Value);
        PDFViewerBuffer.SetRange(FieldId, FieldNo);
    end;

}