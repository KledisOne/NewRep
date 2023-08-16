table 50132 "CSD Seminar Ledger Entry"
{
    // Chapter 8 - Lab 2-1
    // Added key2
    // Chapter 8 - Lab 2 - 3
    // Added LookupPageId & DrilldownPageId properties
    DataClassification = CustomerContent;
    Caption = 'Seminar Ledger Entry';
    LookupPageId = "CSD Seminar Ledger Entries";
    DrillDownPageId = "CSD Seminar Ledger Entries";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(4; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            DataClassification = CustomerContent;
            OptionMembers = any;
        }
        field(5; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            DataClassification = CustomerContent;
        }
        field(6; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(7; "Bill-to Customer"; Code[20])
        {
            Caption = 'Bill-to Customer';
            DataClassification = CustomerContent;
        }
        field(8; "Charge Type"; Option)
        {
            Caption = 'Charge Type';
            DataClassification = CustomerContent;
            OptionMembers = any, Instructor, Room, Participant;
        }
        field(9; "Type"; Option)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
            OptionMembers = any, Resource;

        }
        field(10; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }

        field(11; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(12; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }
        field(13; "Total Price"; Decimal)
        {
            Caption = 'Total Price';
            DataClassification = CustomerContent;
        }
        field(14; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            DataClassification = CustomerContent;
        }
        field(15; "Participant Name"; Text[50])
        {
            Caption = 'Participant Name';
            DataClassification = CustomerContent;
        }
        field(17; "Room Resource No."; Code[20])
        {
            Caption = 'Room Resource No.';
            DataClassification = CustomerContent;
        }
        field(18; "Instructor Resource No."; Code[20])
        {
            Caption = 'Instructor Resource No.';
            DataClassification = CustomerContent;
        }
        field(19; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(20; "Seminar Registration No."; Code[20])
        {
            Caption = 'Seminar Registration No.';
            DataClassification = CustomerContent;
        }
        field(21; "Res. Ledger Entry No."; Integer)
        {
            Caption = 'Res. Ledger Entry No.';
            DataClassification = CustomerContent;
        }
        field(22; "Source Type"; Option)
        {
            Caption = 'Source Type';
            DataClassification = CustomerContent;
            OptionMembers = any;
        }
        field(23; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            DataClassification = CustomerContent;
        }
        field(24; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            DataClassification = CustomerContent;
        }
        field(25; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            DataClassification = CustomerContent;
        }
        field(26; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = CustomerContent;
        }
        field(27; Chargeable; Boolean)
        {
            Caption = 'Chargeable';
            DataClassification = CustomerContent;
        }
        field(28; "User Id"; code[50])
        {
            Caption = 'User Id';
            DataClassification = CustomerContent;
            TableRelation = user where("User Name" = field("User Id"));
            ValidateTableRelation = false;
            trigger OnLookup();
            var
                UserMgt: Codeunit "User Management";
            begin
                // usermgt.LookupUserID("User Id");
            end;
        }
        field(29; "Bill-to Customer No."; code[50])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = CustomerContent;
        }
        field(30; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(key2; "Document No.", "Posting Date")
        {
        }
    }
    var
        SeminarJnlLine: Record "CSD Seminar Journal Line";
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        SeminarRegister: Record "CSD Seminar Register";
        SeminarJnlCheckLine: Codeunit "CSD Seminar Jnl.-Check Line";
        NextEntryNo: Integer;
}

