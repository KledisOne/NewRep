pageextension 50102 "CSD SourceCodeSetupExt" extends "Source Code Setup"
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 1-8
    // - Added new group:
    // - CSD SeminarGroup
    // - Added new fields:
    // - CSD Seminar
    layout
    {
        addafter("Cost Accounting")
        {
            group("CSD SeminarGroup")
            {
                Caption = 'Seminar';
                field("CSD Seminar"; "CSD Seminar")
                {

                }
            }
        }
    }

}