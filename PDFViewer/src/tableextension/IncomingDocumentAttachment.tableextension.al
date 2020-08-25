tableextension 50300 "Incoming Document Attach Ext." extends "Incoming Document Attachment" // 133
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
        InStr: InStream;
        Base64Convert: Codeunit "Base64 Convert";
    begin
        if not Content.HasValue() then
            exit;
        CalcFields(Content);
        Content.CreateInStream(InStr);
        ReturnValue := Base64Convert.ToBase64(InStr);
    end;

}