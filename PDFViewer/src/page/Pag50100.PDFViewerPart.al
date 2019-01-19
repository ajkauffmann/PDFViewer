page 50100 "PDF Viewer Part"
{
    PageType = CardPart;
    Caption = 'PDF Viewer';

    layout
    {
        area(Content)
        {
            usercontrol(PDFViewer; PDFViewer)
            {
                ApplicationArea = All;
                trigger ControlAddInReady()
                begin
                    ControlIsReady := true;
                    ShowData();
                end;
            }
        }
    }

    var
        ControlIsReady: Boolean;
        Data: JsonObject;
        DataType: Option URL,BASE64;

    local procedure ShowData()
    begin
        if not ControlIsReady then
            exit;

        if not Data.Contains('content') then
            exit;

        CurrPage.PDFViewer.LoadDocument(Data);

        Clear(Data);
    end;

    procedure LoadPdfViaUrl(Url: Text)
    begin
        Clear(Data);
        Data.Add('type', 'url');
        Data.Add('content', Url);
        ShowData();
    end;

    procedure LoadPdfFromBase64(Base64Data: Text)
    begin
        Clear(Data);
        Data.Add('type', 'base64');
        Data.Add('content', Base64Data);
        ShowData();
    end;
}