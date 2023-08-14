table 50107 "Posted Seminar Reg. Subform"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Bill-to Customer"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Bill-to Customer';
        }
        field(2; "Participant Contact No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Participant Contact No.';
        }
        field(3; "Participant Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Participant Name';
        }
        field(4; "Registration Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Registration Date';
        }
        field(5; "Confirmation Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Confirmation Date';
        }
        field(6; "To Invoice"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'To Invoice';
        }
        field(7; Registration; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Registration';
        }
        field(8; "Seminar Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Seminar Price';
        }
        field(9; "Line Discount %"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Line Discount %';
        }


    }

    keys
    {
        key(Key1; "Bill-to Customer")
        {
            Clustered = true;
        }
    }
}