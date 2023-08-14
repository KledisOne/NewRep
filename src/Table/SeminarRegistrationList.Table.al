table 50001 "Seminar Registration List"
{
    Caption = 'Seminar Registration List';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Test; Text[100])
        {
            Caption = 'Test';
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
