table 50001 "Seminar Registration List"
{
    Caption = 'Seminar Registration List';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Seminar No."; Text[100])
        {
            Caption = 'Seminar No.';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Test)
        {
            Clustered = true;
        }
    }
}
