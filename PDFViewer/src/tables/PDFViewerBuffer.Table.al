table 50300 PDFViewerBuffer
{
    Caption = 'PDF Viewer Buffer';
    TableType = Temporary;

    fields
    {
        field(1; SourceTableId; Integer)
        {
            Caption = 'Source Type';
        }
        field(2; SourceId; Guid)
        {
            Caption = 'Source Id';
        }
        field(3; FieldId; Integer)
        {
            Caption = 'Field Id';
        }
    }
}
