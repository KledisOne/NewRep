table 50112 "CSD Seminar Setup"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields: Primary Key, Seminar Nos., Seminar Registration Nos., 
    // Posted Seminar Reg. Nos
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;


        }
        field(20; "Seminar No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Seminar No.';

        }
        field(30; "Seminar Registration No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Seminar Registration Nos.';
        }
        field(40; "Posted Seminar Reg. Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Posted Seminar Reg. Nos';
        }

    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}
