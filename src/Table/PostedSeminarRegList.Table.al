table 50108 "Posted Seminar Reg. List"
{
    Caption = 'Posted Seminar Reg. List';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Decimal)
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(3; "Seminar No."; Decimal)
        {
            Caption = 'Seminar No.';
            DataClassification = CustomerContent;
        }
        field(4; "Seminar Name"; Text[100])
        {
            Caption = 'Seminar Name';
            DataClassification = CustomerContent;
        }
        field(5; Status; Text[100])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(6; "Duration"; Decimal)
        {
            Caption = 'Duration';
            DataClassification = CustomerContent;
        }
        field(7; "Maximum Participant"; Decimal)
        {
            Caption = 'Maximum Participant';
            DataClassification = CustomerContent;
        }
        field(8; "Room Resource"; Text[100])
        {
            Caption = 'Room Resource';
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
