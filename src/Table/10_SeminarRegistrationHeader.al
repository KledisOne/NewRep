table 50106 SeminarRegistrationHeader
{
    Caption = 'SeminarRegistrationHeader';
    DataClassification = CustomerContent;

    fields
    {
        field(5; "Instructor Code"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Instructor Code';

        }
        field(6; "Instructor Name"; Text[50])
        {
            CalcFormula = lookup(Resource.Name where("No." = field("Instructor Code"),
           Type = const(Person)));
            Editable = false;
            FieldClass = FlowField;

        }
        field(7; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
        }
        field(8; "Instructor Resource No."; Text[100])
        {
            Caption = 'Instructor Resource No.';
            DataClassification = CustomerContent;
        }
        field(9; "Seminar No."; Text[100])
        {
            Caption = 'Seminar No.';
            DataClassification = CustomerContent;
        }
        field(10; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(13; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(14; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            DataClassification = CustomerContent;
        }
        field(15; "Starting Date"; Date)
        {
            Caption = 'Reason Code';
            DataClassification = CustomerContent;
        }
        field(16; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            DataClassification = CustomerContent;
        }
        field(17; "Room Resource No."; Code[10])
        {
            Caption = 'Room Resource No.';
            DataClassification = CustomerContent;
        }
        field(18; "Seminar Name"; Text[100])
        {
            Caption = 'Seminar Name';
            DataClassification = CustomerContent;
        }
        field(19; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(Key1; "Instructor Code")
        {
            Clustered = true;
        }
    }
    local procedure PostResJnlLine(Resource: Record Resource): Integer;
    var
        ResJnlLine: Record "Res. Journal Line";
        PstdSeminarRegHeader: Record "CSD Posted Seminar Reg.Header";
    begin
        with Rec do begin
            ResJnlLine.Init;
            ResJnlLine."Entry Type" := ResJnlLine."Entry Type"::Usage;
            ResJnlLine."Document No." := PstdSeminarRegHeader."No.";
            ResJnlLine."Resource No." := Resource."No.";
            ResJnlLine."Posting Date" := "Posting Date";
            ResJnlLine."Reason Code" := "Reason Code";
            ResJnlLine.Description := "Seminar Name";
            ResJnlLine."Gen. Prod. Posting Group" :=
            "Gen. Prod. Posting Group";
            ResJnlLine."Posting No. Series" := "Posting No. Series";
            ResJnlLine."Source Code" := "Source Code";
            ResJnlLine."Resource No." := Resource."No.";
            ResJnlLine."Unit of Measure Code" :=
            Resource."Base Unit of Measure";
            ResJnlLine."Unit Cost" := Resource."Unit Cost";
            ResJnlLine."Qty. per Unit of Measure" := 1;
            ResJnlLine.Quantity := Duration * Resource."CSD Quantity Per Day";
            ResJnlLine."Total Cost" := ResJnlLine."Unit Cost" *
            ResJnlLine.Quantity;
            ResJnlLine."Seminar No." := "Seminar No.";
            ResJnlLine."CSD Seminar Registration No." :=
            PstdSeminarRegHeader."No.";
            ResJnlPostLine.RunWithCheck(ResJnlLine);
            ResLedgEntry.FindLast;
            exit(ResLedgEntry."Entry No.");

        end;
    end;

    local procedure PostSeminarJnlLine(ChargeType: Option Instructor,Room,Participant,Charge);
    var
        SeminarJnlLine: Record "CSD Seminar Journal Line";
        SeminarRegistrationHeader: Record SeminarRegistrationHeader;
        PstdSeminarRegHeader: Record "CSD Posted Seminar Reg.Header";
    begin

        with Rec do begin

            SeminarJnlLine."Seminar No." := "Seminar No.";
            SeminarJnlLine."Posting Date" := "Posting Date";
            SeminarJnlLine."Document Date" := "Document Date";
            SeminarJnlLine."Document No." := PstdSeminarRegHeader."No.";
            SeminarJnlLine."Charge Type" := ChargeType;
            SeminarJnlLine."Instructor Resource No." := "Instructor Resource No.";
            SeminarJnlLine."Starting Date" := "Starting Date";
            SeminarJnlLine."Seminar Registration No." := PstdSeminarRegHeader."No.";
            SeminarJnlLine."Room Resource No." := "Room Resource No.";
            SeminarJnlLine."Source Type" := SeminarJnlLine."Source Type"::Seminar;
            SeminarJnlLine."Source Code" := "Source Code";
            SeminarJnlLine."Reason Code" := "Reason Code";
            SeminarJnlLine."Posting No. Series" := "Posting No. Series";
        end;
    end;

    var
        Text002: TextConst ENU = 'You cannont change the %1, ';

}