pageextension 50302 DocumentAttachmentDetailsExt extends "Document Attachment Details"
{
    actions
    {
        addlast(Processing)
        {
            action(ViewPDF)
            {
                ApplicationArea = All;
                Caption = 'View';
                Image = View;
                Enabled = Rec."File Type" = Rec."File Type"::PDF;
                Scope = "Repeater";

                trigger OnAction()
                begin
                    Rec.ViewAttachment(false);
                end;
            }
            action(ViewPDFPopup)
            {
                ApplicationArea = All;
                Caption = 'View in new window';
                Image = View;
                Enabled = Rec."File Type" = Rec."File Type"::PDF;
                Scope = "Repeater";

                trigger OnAction()
                begin
                    Rec.ViewAttachment(true);
                end;
            }
        }
    }
}