table 50133 "CSD Seminar Register"
{
    Caption = 'Seminar Registers';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
            DataClassification = CustomerContent;
        }
        field(3; "To. Entry No."; Integer)
        {
            Caption = 'To. Entry No.';
            DataClassification = CustomerContent;
        }
        field(4; "Creation Date"; Code[100])
        {
            Caption = 'Creation Date';
            DataClassification = CustomerContent;
        }
        field(5; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            DataClassification = CustomerContent;
        }
        field(6; "User ID"; Text[50])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(7; "Journal Batch"; Code[10])
        {
            Caption = 'Journal Batch';
            DataClassification = CustomerContent;
        }


    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
   

    var
        SeminarJnlLine: Record "CSD Seminar Journal Line";
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        SeminarRegister: Record "CSD Seminar Register";
        SeminarJnlCheckLine: Codeunit "CSD Seminar Jnl.-Check Line";
        NextEntryNo: Integer;
}

