codeunit 50300 GetPDFDataMeth
{
    var
        MissingFiltersErr: Label 'The source type, source id or field id is missing.';
        UnsupportedDataTypeErr: Label 'The data type %1 is not supported.';

    procedure GetData(var PDFViewerBuffer: Record PDFViewerBuffer) Data: JsonObject
    var
        Content, ContentType : Text;
    begin
        GetContent(PDFViewerBuffer, ContentType, Content);
        Data.Add('type', ContentType);
        Data.Add('content', Content);
    end;

    local procedure GetContent(var PDFViewerBuffer: Record PDFViewerBuffer; var ContentType: Text; var Content: Text)
    var
        SourceTableFilter: Integer;
        SourceIdFilter: Text;
        FieldIdFilter: Integer;
        RecRef: RecordRef;
        FldRef: FieldRef;
        TempBlob: Codeunit "Temp Blob";
    begin
        if Evaluate(SourceTableFilter, PDFViewerBuffer.GetFilter(SourceTableId)) then;
        SourceIdFilter := PDFViewerBuffer.GetFilter(SourceId);
        if Evaluate(FieldIdFilter, PDFViewerBuffer.GetFilter(FieldId)) then;

        if (SourceTableFilter = 0) or (SourceIdFilter = '') or (FieldIdFilter = 0) then
            Error(MissingFiltersErr);

        RecRef.Open(SourceTableFilter);
        RecRef.GetBySystemId(SourceIdFilter);
        FldRef := RecRef.Field(FieldIdFilter);

        GetContentFromFieldRef(FldRef, ContentType, Content);

        RecRef.Close();
    end;

    local procedure GetContentFromFieldRef(FldRef: FieldRef; var ContentType: Text; var Content: Text)
    var
        TempBlob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        InStr: InStream;
    begin
        case FldRef.Type of
            FldRef.Type::Blob,
            FldRef.Type::Media:
                begin
                    TempBlob := GetTempBlobFromFldRef(FldRef);
                    TempBlob.CreateInStream(InStr);
                    ContentType := 'base64';
                    Content := Base64Convert.ToBase64(InStr);
                end;
            FldRef.Type::Text:
                begin
                    ContentType := 'url';
                    Content := FldRef.Value;
                end;
            else
                Error(UnsupportedDataTypeErr, FldRef.Type);
        end
    end;

    local procedure GetTempBlobFromFldRef(FldRef: FieldRef) TempBlob: Codeunit "Temp Blob"
    var
        TenantMedia: Record "Tenant Media";
    begin
        case FldRef.Type of
            FldRef.Type::Blob:
                begin
                    TempBlob.FromFieldRef(FldRef);
                end;
            FldRef.Type::Media:
                begin
                    TenantMedia.Get(Format(FldRef.Value));
                    TempBlob.FromRecord(TenantMedia, TenantMedia.FieldNo(Content));
                end;
        end
    end;
}