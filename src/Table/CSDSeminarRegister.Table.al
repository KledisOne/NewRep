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
        field(4; "Creation Date"; Date)
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
        field(8; "Seminar No."; Code[10])
        {
            Caption = 'Seminar No.';
            DataClassification = CustomerContent;
        }
        field(9; "Instructor Code"; Code[10])
        {
            Caption = 'Instructor Code';
            DataClassification = CustomerContent;
        }
        field(10; "Instructor Name"; Code[10])
        {
            Caption = 'Instructor Name';
            DataClassification = CustomerContent;
        }
        field(11; "No. Printed"; Code[10])
        {
            Caption = 'No. Printed';
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

