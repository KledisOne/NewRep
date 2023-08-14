pageextension 50103 "CSD ResourceLedgerEntryExt" extends "Resource Ledger Entries"
{
    // CSD1.00 - 2023-08-07 - KGJ
// Chapter 7 - Lab 4-3
    layout
    {
        addlast(content)
        {
            field("CSD Seminar No."; "CSD Seminar No.")
            {
                Caption = 'CSD Seminar No.';
            }
            field("CSD Seminar Registration No."; "CSD Seminar Registration No.")
            {
                Caption = 'CSD Seminar Registration No.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}