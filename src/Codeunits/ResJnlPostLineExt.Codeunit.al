codeunit 50001 "Res. Jnl.-Post LineExt"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Res. Jnl.-Post Line", 'OnBeforeResLedgEntryInsert', '', false, false)]
    local procedure MyProcedure(ResJournalLine: Record "Res. Journal Line"; var ResLedgerEntry: Record "Res. Ledger Entry")
    var
        CSDSeminarSetup: Record "CSD Seminar Setup";
    begin
        ResLedgerEntry."Seminar No." := CSDSeminarSetup."Seminar No.";
        ResLedgerEntry."Seminar Registration No." := CSDSeminarSetup."Seminar Registration No.";
    end;

    local procedure PostResJnlLine(Resource: Record Resource):
Integer;
    var
        SeminarRegHeader: Record SeminarRegistrationHeader;
        ResJnlLine: Record "Res. Journal Line";
        PstdSeminarRegHeader: Record "CSD Posted Seminar Reg.Header";
    begin
        with SeminarRegHeader do begin
            ResJnlLine.Init;
            ResJnlLine."Entry Type" := ResJnlLine."Entry Type"::Usage;
            ResJnlLine."Document No." := PstdSeminarRegHeader."No.";
            ResJnlLine."Resource No." := Resource."No.";
            ResJnlLine."Posting Date" := "Posting Date";
            ResJnlLine."Reason Code" := "Reason Code";
            ResJnlLine.Description := "Seminar Name";
            ResJnlLine."Gen. Prod. Posting Group" := "Gen. Prod. Posting Group";
            ResJnlLine."Posting No. Series" := "Posting No. Series";
            ResJnlLine."Source Code" := "Source Code";
            ResJnlLine."Resource No." := Resource."No.";
            ResJnlLine."Unit of Measure Code" :=
            Resource."Base Unit of Measure";
            ResJnlLine."Unit Cost" := Resource."Unit Cost";
            ResJnlLine."Qty. per Unit of Measure" := 1;
            ResJnlLine.Quantity := Duration *
Resource."Quantity Per Day";
            ResJnlLine."Total Cost" := ResJnlLine."Unit Cost" *
            ResJnlLine.Quantity;
            ResJnlLine."CSD Seminar No." := "Seminar No.";
            ResJnlLine."CSD Seminar Registration No." :=
            PstdSeminarRegHeader."No.";
            ResJnlPostLine.RunWithCheck(ResJnlLine);
            ResLedgEntry.FindLast;
            exit(ResLedgEntry."Entry No.");
        end;


    end;

    local procedure PostSeminarJnlLine(ChargeType: Option
Instructor,Room,Participant,Charge);
    var
        SeminarRegHeader: Record SeminarRegistrationHeader;
        SeminarJnlLine: Record "CSD Seminar Journal Line";
        PstdSeminarRegHeader: Record "CSD Posted Seminar Reg.Header";
    begin
        with SeminarRegHeader do begin
            SeminarJnlLine.init;
            SeminarJnlLine."Seminar No." := "Seminar No.";
            SeminarJnlLine."Posting Date" := "Posting Date";
            SeminarJnlLine."Document Date" := "Document Date";
            SeminarJnlLine."Document No." :=
            PstdSeminarRegHeader."No.";
            SeminarJnlLine."Charge Type" := ChargeType;
            SeminarJnlLine."Instructor Resource No." :=
            "Instructor Resource No.";
            SeminarJnlLine."Starting Date" := "Starting Date";
            SeminarJnlLine."Seminar Registration No." :=
            PstdSeminarRegHeader."No.";
            SeminarJnlLine."Room Resource No." :=
            "Room Resource No.";
            SeminarJnlLine."Source Type" :=
            SeminarJnlLine."Source Type"::Seminar;
            SeminarJnlLine."Source No." := "Seminar No.";
            SeminarJnlLine."Source Code" := "Source Code";
            SeminarJnlLine."Reason Code" := "Reason Code";
            SeminarJnlLine."Posting No. Series" :=
            "Posting No. Series";
            case ChargeType of
                ChargeType::Instructor:
                    Begin
                        Instructor.get("Instructor Resource No.");
                        SeminarJnlLine.Description := Instructor.Name;
                        SeminarJnlLine.Type :=
                        SeminarJnlLine.Type::Resource;
                        SeminarJnlLine.Chargeable := false;
                        SeminarJnlLine.Quantity := Duration;
                        SeminarJnlLine."Res. Ledger Entry No." :=
                        PostResJnlLine(Instructor);
                    end;
                ChargeType::Room:
                    begin
                        Room.GET("Room Resource No.");
                        SeminarJnlLine.Description := Room.Name;
                        SeminarJnlLine.Type := SeminarJnlLine.Type::Resource;
                        SeminarJnlLine.Chargeable := false;
                        SeminarJnlLine.Quantity := Duration;
                        // Post to resource ledger
                        SeminarJnlLine."Res. Ledger Entry No." :=
                        PostResJnlLine(Room);
                    end;
                ChargeType::Participant:
                    begin
                        SeminarJnlLine."Bill-to Customer No." :=
                        SeminarRegLine."Bill-to Customer No.";
                        SeminarJnlLine."Participant Contact No." :=
                        SeminarRegLine."Participant Contact No.";
                        SeminarJnlLine."Participant Name" :=
                        SeminarRegLine."Participant Name";
                        SeminarJnlLine.Description :=
                        SeminarRegLine."Participant Name";
                        SeminarJnlLine.Type := SeminarJnlLine.Type::Resource;
                        SeminarJnlLine.Chargeable := SeminarRegLine."To Invoice";
                        SeminarJnlLine.Quantity := 1;
                        SeminarJnlLine."Unit Price" := SeminarRegLine.Amount;
                        SeminarJnlLine."Total Price" := SeminarRegLine.Amount;
                    end;
                ChargeType::Charge:
                    begin
                        SeminarJnlLine.Description :=
                        SeminarCharge.Description;
                        SeminarJnlLine."Bill-to Customer No." :=
                        SeminarCharge."Bill-to Customer No.";
                        SeminarJnlLine.Type := SeminarCharge.Type;
                        SeminarJnlLine.Quantity := SeminarCharge.Quantity;
                        SeminarJnlLine."Unit Price" :=
                        SeminarCharge."Unit Price";
                        SeminarJnlLine."Total Price" :=
                        SeminarCharge."Total Price";
                        SeminarJnlLine.Chargeable :=
                        SeminarCharge."To Invoice";
                    end;
            end;
            SeminarJnlPostLine.RunWithCheck(SeminarJnlLine);
        end;
        
    end;
}
