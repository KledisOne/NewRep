tableextension 50103 "CSD ResourceLedgerEntryExt" extends "Res. Ledger Entry"
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 4-1
    // Chapter 7 - Lab 4-2
    fields
    {
        field(50000; "Resource Ledger Entry"; Code[20])
        {
            Caption = 'Resource Ledger Entry';
            DataClassification = CustomerContent;
            TableRelation = Resource."No.";
        }
        field(50100; "CSD Seminar No."; code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
        }
        field(50101; "CSD Seminar Registration No."; Code[20])
        {
            Caption = 'CSD Seminar Registration No.';
            DataClassification = CustomerContent;
            TableRelation = SeminarRegistrationHeader;
        }
    }
}