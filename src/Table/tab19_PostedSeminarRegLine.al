table 50119 "CSD Posted Seminar Reg. Line"
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 3-3

    Caption = 'CSD Posted Seminar Reg. Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "test1"; Integer)
        {
            Caption = 'test1';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; test1)
        {
            Clustered = true;
        }
    }
}
