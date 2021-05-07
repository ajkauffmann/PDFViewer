tableextension 50302 DocumentAttachmentExt extends "Document Attachment"
{
    procedure ViewAttachment(Popup: Boolean)
    begin
        if ID = 0 then
            exit;

        case Rec."File Type" of
            Rec."File Type"::PDF:
                ViewInPdfViewer(Popup);
        end
    end;

    local procedure ViewInPdfViewer(Popup: Boolean)
    var
        OpenPdfViewerMeth: Codeunit OpenPdfViewerMeth;
    begin
        OpenPdfViewerMeth.OpenPdfViewer(Rec, Rec.FieldNo("Document Reference ID"), Popup);
    end;

}