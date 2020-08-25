pageextension 50301 "Incoming Document Files Ext." extends "Incoming Doc. Attach. FactBox" // 193
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
                Visible = Type = Type::PDF;
                Scope = "Repeater";

                trigger OnAction()
                begin
                    ViewAttachment();
                end;
            }
        }
    }
}