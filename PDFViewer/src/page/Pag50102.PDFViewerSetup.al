page 50102 "PDF Viewer Setup"
{
    PageType = Card;
    SourceTable = "PDF Viewer Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = Basic;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Web Viewer URL"; "Web Viewer URL")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        GetRecord();
    end;
}