table 50142 "My Seminars"
// CSD1.00 - 2023-08-07 - KGJ
// Chapter 10 - Lab 1 - 3
// - Created new page
{
    DataClassification = CustomerContent;
    Caption = 'My Seminars';

    fields
    {
        field(10; "User Id"; Code[50])
        {
            Caption = 'User Id';
            TableRelation = User;
            DataClassification = CustomerContent;
        }
        field(20; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "User Id", "Seminar No.")
        {
            Clustered = true;
        }
    }
}