pageextension 50100 "Incoming Document Card Ext." extends "Incoming Document" // 189
{
    layout
    {
        addfirst(FactBoxes)
        {
            part(PDFViewer; "PDF Viewer Part")
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
        TempBlob: Record TempBlob temporary;
        IncomingDocumentAttachment: Record "Incoming Document Attachment";
    begin
        if not GetMainAttachment(IncomingDocumentAttachment) then
            exit;

        if IncomingDocumentAttachment.Type <> IncomingDocumentAttachment.Type::PDF then
            exit;

        IncomingDocumentAttachment.CalcFields(Content);
        if not IncomingDocumentAttachment.Content.HasValue() then
            exit;

        TempBlob.Blob := IncomingDocumentAttachment.Content;
        CurrPage.PDFViewer.Page.LoadPdfFromBase64(IncomingDocumentAttachment.ToBase64String());
    end;
}