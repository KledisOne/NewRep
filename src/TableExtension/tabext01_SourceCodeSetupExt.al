tableextension 50101 "CSD SourceCodeSetupExt" extends "Source Code Setup"
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 1-7
    // - Added new fields:
    // - CSD Seminar
    fields
    {
        field(50100; "CSD Seminar"; Code[10])
        {
            Caption = 'Seminar';
            TableRelation = "Source Code";
        }
    }

}