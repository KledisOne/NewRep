table 50131 "CSD Seminar Journal Line"
{// CSD1.00 - 2023-08-07 - KGJ
 // Chapter 7 - Lab 2-1
    Caption = 'Seminar Journal Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
            trigger OnValidate();
            begin
                Validate("Document Date", "Posting Date");
            end;
        }
        field(2; "Instructor Resource No."; Text[100])
        {
            Caption = 'Instructor Resource No.';
            DataClassification = CustomerContent;
        }
        field(3; "No."; Decimal)
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(4; "Seminar No."; Text[100])
        {
            Caption = 'Seminar No.';
            DataClassification = CustomerContent;
        }
        field(5; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            DataClassification = CustomerContent;
        }
        field(6; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            DataClassification = CustomerContent;
        }
        field(7; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(8; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(9; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = CustomerContent;
        }
        field(10; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(11; "Document No."; Code[50])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(12; "Charge Type"; Option)
        {
            Caption = 'Charge Type';
            DataClassification = CustomerContent;
            OptionMembers = Instructor,Room,Participant,Charge;
        }
        field(13; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(14; "Seminar Registration No."; Code[10])
        {
            Caption = 'Seminar Registration No.';
            DataClassification = CustomerContent;
        }
        field(15; "Room Resource No."; Code[10])
        {
            Caption = 'Room Resource No.';
            DataClassification = CustomerContent;
        }
        field(16; "Source Type"; Option)
        {
            Caption = 'Source Type';
            DataClassification = CustomerContent;
            OptionMembers = Seminar;
        }
        field(17; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            DataClassification = CustomerContent;
        }
        field(18; "Source No."; Text[100])
        {
            Caption = 'Source No.';
            DataClassification = CustomerContent;
        }
        field(19; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Posting Date", "Journal Batch Name", "Journal Template Name")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if EmptyLine() then
            Error('Line is empty');

    end;
    // local procedure EmptyLine(): Boolean
    // begin
    //     Get(Rec);
    //     if Rec.IsEmpty then
    //         exit(true);
    // end;

    procedure EmptyLine(): Boolean;
    begin
        case "Charge Type" of
            "Charge Type"::Instructor:
                TestField("Instructor Resource No.");
            "Charge Type"::Room:
                TestField("Room Resource No.");
            "Charge Type"::Participant:
                TestField("Participant Contact No.");
        end;

        if "Posting Date" = ClosingDate("Posting Date") then
            FieldError("Posting Date", ClosingDateTxt);

        if Chargeable then
            TestField("Bill-to Customer No.");

        if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
            if UserId <> '' then
                if UserSetup.GET(UserId) then begin
                    AllowPostingFrom := UserSetup."Allow Posting From";
                    AllowPostingTo := UserSetup."Allow Posting To";
                end;
            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D)
            then begin
                GLSetup.GET;
                AllowPostingFrom := GLSetup."Allow Posting From";
                AllowPostingTo := GLSetup."Allow Posting To";
            end;
            if AllowPostingTo = 0D then
                AllowPostingTo := DMY2Date(31, 12, 9999);
        end;
        if ("Posting Date" < AllowPostingFrom) OR
        ("Posting Date" > AllowPostingTo) then
            FieldError("Posting Date", PostingDateTxt);

        TestField("Posting Date");
        TestField("Instructor Resource No.");
        TestField("Seminar No.");
        exit((Rec."Seminar No." = '') AND (Rec.Quantity = 0) AND ("Posting Date" = 0D) AND ("Resource No." = 0));
    end;



    var
        SeminarJnlLine: Record "CSD Seminar Journal Line";
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        SeminarRegister: Record "CSD Seminar Register";
        SeminarJnlCheckLine: Codeunit "CSD Seminar Jnl.-Check Line";
        NextEntryNo: Integer;
}
