codeunit 50134 "CSD Seminar Reg.-Show"
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 2-10
    TableNo = "CSD Seminar Register";
    trigger OnRun();
    begin
        SeminarLedgerEntry.SETRANGE("Entry No.", "From Entry No.", "To. Entry No.");
        page.Run(Page::"CSD Seminar Ledger Entries",
        SeminarLedgerEntry);
    end;

    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
}