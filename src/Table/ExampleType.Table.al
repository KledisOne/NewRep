table 50126 ExampleType
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields: Code, Description
    DataClassification = CustomerContent;
    Caption = 'Example Type';
    DrillDownPageId = "Example Types";
    LookupPageId = "Example Types";

    fields
    {
        field(1; Code; code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
    }

    keys
    {
        key(Pk; Code)
        {
            Clustered = true;
        }
    }
}