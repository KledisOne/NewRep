table 50120 SeminarCommentLine
{
    DataClassification = CustomerContent;
    Caption = 'Seminar Comment Line';

    fields
    {
        field(1; TableName; Integer)
        {
            Caption = 'Table Name';
            DataClassification = CustomerContent;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(3; "Table Name"; Integer)
        {
            Caption = 'Table Name';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; TableName)
        {
            Clustered = true;
        }
    }

    local procedure CopyCommentLines(FromDocumentType: Integer; ToDocumentType: Integer; FromNumber: Code[20]; ToNumber: Code[20]);
    begin
        Rec.Reset;
        Rec.SetRange(TableName,
        FromDocumentType);
        Rec.SetRange("No.", FromNumber);
        if Rec.FindSet then
            repeat
                Rec := Rec;
                Rec.TableName := ToDocumentType;
                Rec."No." := ToNumber;
                Rec.Insert;
            until Rec.Next = 0;
    end;

}