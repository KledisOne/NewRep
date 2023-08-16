table 50109 "Posted Seminar Registration"
{
    Caption = 'Posted Seminar Registration';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(4; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(5; "Seminar No."; Decimal)
        {
            Caption = 'Seminar No.';
            DataClassification = CustomerContent;
        }
        field(6; Status; Text[100])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(7; "Seminar Name"; Text[100])
        {
            Caption = 'Seminar Name';
            DataClassification = CustomerContent;
        }
        field(8; "Duration"; Text[100])
        {
            Caption = 'Duration';
            DataClassification = CustomerContent;
        }
        field(9; "Instructor Resource No."; Decimal)
        {
            Caption = 'Instructor Resource No.';
            DataClassification = CustomerContent;
        }
        field(10; "Minimum Participants"; Decimal)
        {
            Caption = 'Minimum Participants';
            DataClassification = CustomerContent;
        }
        field(11; "Instructor Name"; Text[100])
        {
            Caption = 'Instructor Name';
            DataClassification = CustomerContent;
        }
        field(12; "Maximum Participants"; Decimal)
        {
            Caption = 'Maximum Participants';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
