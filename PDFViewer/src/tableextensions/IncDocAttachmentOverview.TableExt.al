tableextension 50301 IncDocAttachOverviewExt extends "Inc. Doc. Attachment Overview"
{
    procedure ViewAttachment(Popup: Boolean)
    var
        IncomingDocumentAttachment: Record "Incoming Document Attachment";
        NotAvailableAttachmentMsg: Label 'The attachment is no longer available.';
    begin
        if IncomingDocumentAttachment.Get("Incoming Document Entry No.", "Line No.") then
            IncomingDocumentAttachment.ViewAttachment(Popup)
        else
            Message(NotAvailableAttachmentMsg);
    end;


}