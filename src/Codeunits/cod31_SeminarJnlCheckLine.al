codeunit 50131 "CSD Seminar Jnl.-Check Line"
{

    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 2-8
    TableNo = "CSD Seminar Journal Line";

    local procedure CheckSeminarJnlCheckLine()
    var
        CSDSeminarJournalLine: Record "CSD Seminar Journal Line";
    begin
        CSDSeminarJournalLine.Get();
        if (CSDSeminarJournalLine."Posting Date" = 0D) And (CSDSeminarJournalLine."Instructor Resource No." = '')
        And (CSDSeminarJournalLine."No." = 0) And (CSDSeminarJournalLine."Seminar No." = '') then
            Error('Ploteso Fushat !');
    end;

    procedure RunCheck(var SemJnlLine: Record "CSD Seminar Journal Line");
    var
        SeminarRegister: Record "CSD Seminar Register";
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
    begin
        With SemJnlLine do begin
            if NextEntryNo = 0 then begin
                SeminarLedgerEntry.LockTable;
                if SeminarLedgerEntry.FindLast then
                    NextEntryNo := SeminarLedgerEntry."Entry No.";
                NextEntryNo := NextEntryNo + 1;
                if SeminarRegister."No." = 0 then begin
                    SeminarRegister.LockTable;
                    if (not SeminarRegister.FindLast) or
                    (SeminarRegister."To. Entry No." <> 0) then begin
                        SeminarRegister.INIT;
                        SeminarRegister."No." := SeminarRegister."No." + 1;
                        SeminarRegister."From Entry No." := NextEntryNo;
                        SeminarRegister."To. Entry No." := NextEntryNo;
                        SeminarRegister."Creation Date" := Today;
                        SeminarRegister."Source Code" := "Source Code";
                        SeminarRegister."Journal Batch" :=
                        "Journal Batch Name";
                        SeminarRegister."User ID" := USERID;
                        SeminarRegister.Insert;
                    end;
                    SeminarRegister."To. Entry No." := NextEntryNo;
                    SeminarRegister.Modify;

                    SeminarLedgerEntry.INIT;
                    SeminarLedgerEntry."Seminar No." := "Seminar No.";
                    SeminarLedgerEntry."Posting Date" := "Posting Date";
                    SeminarLedgerEntry."Document Date" := "Document Date";
                    SeminarLedgerEntry."Entry Type" := "Entry Type";
                    SeminarLedgerEntry."Document No." := "Document No.";
                    SeminarLedgerEntry.Description := Description;
                    SeminarLedgerEntry."Bill-to Customer No." :=
                    "Bill-to Customer No.";
                    SeminarLedgerEntry."Charge Type" := "Charge Type";
                    SeminarLedgerEntry.Type := Type;

                    SeminarLedgerEntry.Quantity := Quantity;
                    SeminarLedgerEntry."Unit Price" := "Unit Price";
                    SeminarLedgerEntry."Total Price" := "Total Price";
                    SeminarLedgerEntry."Participant Contact No." :=
                    "Participant Contact No.";
                    SeminarLedgerEntry."Participant Name" :=
                    "Participant Name";
                    SeminarLedgerEntry.Chargeable := Chargeable;
                    SeminarLedgerEntry."Room Resource No." :=
                    "Room Resource No.";
                    SeminarLedgerEntry."Instructor Resource No." :=
                    "Instructor Resource No.";
                    SeminarLedgerEntry."Starting Date" := "Starting Date";
                    SeminarLedgerEntry."Seminar Registration No." :=
                    "Seminar Registration No.";
                    SeminarLedgerEntry."Res. Ledger Entry No." :=
                    "Res. Ledger Entry No.";
                    SeminarLedgerEntry."Source Type" := "Source Type";
                    SeminarLedgerEntry."Source No." := "Source No.";
                    SeminarLedgerEntry."Journal Batch Name" :=
                    "Journal Batch Name";
                    SeminarLedgerEntry."Source Code" := "Source Code";
                    SeminarLedgerEntry."Reason Code" := "Reason Code";
                    SeminarLedgerEntry."Posting No. Series" := "No. Series";
                    SeminarLedgerEntry."Entry No." := NextEntryNo;
                    NextEntryNo += 1;
                    SeminarLedgerEntry.Insert;
                end;
            end;
        end;
    end;

    trigger OnRun();
    begin
        RunCheck(Rec);
    end;

    var
        NextEntryNo: Integer;
}