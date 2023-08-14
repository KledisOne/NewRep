page 50101 "CSD Seminar Setup"
// STR - CSD1.00 - 2023-08-07 - KGJ
// Chapter 5 - Lab 1-2
// Added new fields:  Seminar Nos., Seminar Registration Nos., Posted Seminar Reg. Nos.
{
    PageType = Card;
    SourceTable = "CSD Seminar Setup";
    Caption = 'Seminar Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("Seminar Nos."; Rec."Seminar No.")
                {
                }
                field("Seminar Registration Nos.";
                Rec."Seminar Registration No.")
                {
                }
                field("Posted Seminar Reg. Nos."; Rec."Posted Seminar Reg. Nos")
                {
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        if not Rec.Get then begin
            Rec.init;
            Rec.insert;
        end;
    end;
}