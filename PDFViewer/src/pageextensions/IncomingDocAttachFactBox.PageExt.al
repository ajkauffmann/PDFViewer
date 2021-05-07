pageextension 50301 IncomingDocAttachFactboxExt extends "Incoming Doc. Attach. FactBox" // 193
{
    actions
    {
        addafter(Export)
        {
            action(ViewPDF)
            {
                ApplicationArea = All;
                Caption = 'View';
                Image = View;
                Enabled = Rec.Type = Rec.Type::PDF;
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
                Enabled = Rec.Type = Rec.Type::PDF;
                Scope = "Repeater";

                trigger OnAction()
                begin
                    Rec.ViewAttachment(true);
                end;
            }
        }
    }
}