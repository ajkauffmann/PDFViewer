tableextension 50100 "Incoming Document Attach Ext." extends "Incoming Document Attachment" // 133
{
    procedure ViewAttachment()
    var
        PdfViewer: Page "PDF Viewer";
    begin
        case Type of
            Type::PDF:
                ViewInPdfViewer();
        end;
    end;

    procedure ViewInPdfViewer()
    var
        PdfViewer: Page "PDF Viewer";
    begin
        if Type <> Type::PDF then
            exit;

        PdfViewer.LoadPdfFromBlob(ToBase64String());
        PdfViewer.Run();
    end;

    procedure ToBase64String() ReturnValue: Text
    var
        TempBlob: Record TempBlob temporary;
    begin
        CalcFields(Content);
        if not Content.HasValue() then
            exit;

        TempBlob.Blob := Content;
        ReturnValue := TempBlob.ToBase64String();
    end;

}