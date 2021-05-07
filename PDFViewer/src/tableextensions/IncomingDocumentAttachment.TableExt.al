tableextension 50300 IncomingDocumentAttachExt extends "Incoming Document Attachment"
{
    procedure ViewAttachment(Popup: Boolean)
    begin
        case Type of
            Type::PDF:
                ViewInPdfViewer(Popup);
        end;
    end;

    procedure ViewInPdfViewer(Popup: Boolean)
    var
        OpenPdfViewerMeth: Codeunit OpenPdfViewerMeth;
    begin
        OpenPdfViewerMeth.OpenPdfViewer(Rec, Rec.FieldNo(Content), Popup);
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