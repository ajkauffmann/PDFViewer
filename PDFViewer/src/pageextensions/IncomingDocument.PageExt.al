pageextension 50300 IncomingDocumentCardExt extends "Incoming Document"
{
    layout
    {
        addfirst(FactBoxes)
        {
            part(PDFViewer; PDFViewerPart)
            {
                Caption = 'PDF Viewer';
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowPdfInViewer();
    end;

    local procedure ShowPdfInViewer()
    var
        IncomingDocumentAttachment: Record "Incoming Document Attachment";
    begin
        if not Rec.GetMainAttachment(IncomingDocumentAttachment) then
            exit;

        if IncomingDocumentAttachment.Type <> IncomingDocumentAttachment.Type::PDF then
            exit;

        if not IncomingDocumentAttachment.Content.HasValue() then
            exit;

        CurrPage.PDFViewer.Page.LoadPdfFromBase64(IncomingDocumentAttachment.ToBase64String());
    end;
}