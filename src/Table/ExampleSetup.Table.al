table 50124 "Example Setup"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields: Primary Key, Example Nos., Document Nos.
    Caption = 'Example Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; "Example Nos."; Code[20])
        {
            Caption = 'Example Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(3; "Document Nos."; Code[20])
        {
            Caption = 'Document Nos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
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