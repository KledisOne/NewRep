table 50103 "CSD Seminar Setup"
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
            DataClassification = CustomerContent;


        }
        field(20; "Seminar Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";

        }
        field(30; "Seminar Registration Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(40; "Posted Seminar Reg. Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
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