page 50300 "PDF Viewer"
{
    PageType = List;

    layout
    {
        area(Content)
        {
            usercontrol(PDFViewer; PDFViewer)
            {
                ApplicationArea = All;
                trigger OnControlAddInReady()
                begin
                    InitializePDFViewer();
                end;

                trigger OnPdfViewerReady()
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
        ContentType: Option URL,BASE64;
        Content: Text;

    local procedure InitializePDFViewer()
    var
        PDFViewerMgt: Codeunit PDFViewerMgt;
    begin
        CurrPage.PDFViewer.InitializeControl(PDFViewerMgt.GetPdfViewerUrl());
    end;

    local procedure ShowData()
    begin
        if Content = '' then
            exit;

        Clear(Data);
        Data.Add('type', Format(ContentType));
        Data.Add('content', Content);

        CurrPage.PDFViewer.LoadDocument(Data);

        Clear(Data);
    end;

    procedure LoadPdfViaUrl(Url: Text)
    begin
        ContentType := ContentType::URL;
        Content := Url;
    end;

    procedure LoadPdfFromBlob(Base64Data: Text)
    begin
        ContentType := ContentType::BASE64;
        Content := Base64Data;
    end;

}