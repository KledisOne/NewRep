table 50116 SeminarRegistrationLine
{
    DataClassification = CustomerContent;
    Caption = 'Seminar Registration Line';
    fields
    {
        field(1; "Document No."; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }
         field(3; "No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(4; "Bill-to Customer No."; Code[50])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = CustomerContent;
        }
        field(5; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            DataClassification = CustomerContent;
        }
        field(6; "Participant Name"; Text[50])
        {
            Caption = 'Participant Name';
            DataClassification = CustomerContent;
        }
        field(28; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            DataClassification = CustomerContent;
        }
        field(29; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(30; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            DataClassification = CustomerContent;
        }
        field(31; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DataClassification = CustomerContent;
        }
        field(32; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Line No.", "Document No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}