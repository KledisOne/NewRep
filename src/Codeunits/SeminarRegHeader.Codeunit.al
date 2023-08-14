codeunit 50002 SeminarRegHeader
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 4-7
    trigger OnRun();
    begin
        ClearAll;
        SeminarRegHeader := Rec;
        with SeminarRegHeader do begin
            TestField("Posting Date");
            TestField("Document Date");
            TestField("Seminar No.");
            TestField(Duration);
            TestField("Instructor Resource No.");
            TestField("Room Resource No.");
            TestField(Status, Status::Closed);
        end;
        Rec := SeminarRegHeader;
        SeminarRegLine.Reset;
        SeminarRegLine.SetRange("Document No.", "No.");
        if SeminarRegLine.IsEmpty then
            Error(Text001);
        Window.Open('#1#################################\\' +
Text002);
        Window.Update(1, StrSubstNo('%1 %2', Text003, "No."));
        if SeminarRegHeader."Posting No." = '' then begin
            TestField("Posting No. Series");
            "Posting No." := NoSeriesMgt.GetNextNo("Posting No.
Series","Posting Date",true);
modify;
            Commit;
        end;
        SeminarRegLine.LockTable;
        SourceCodeSetup.Get;
        SourceCode := SourceCodeSetup.Seminar;

        PstdSeminarRegHeader.Init;
        PstdSeminarRegHeader.TransferFields(SeminarRegHeader);
        PstdSeminarRegHeader."No." := "Posting No.";
        PstdSeminarRegHeader."No. Series" := "Posting No. Series";
        PstdSeminarRegHeader."Source Code" := SourceCode;
        PstdSeminarRegHeader."User ID" := UserId;
        PstdSeminarRegHeader.Insert;

        Window.Update(1, StrSubstNo(Text004, "No.",
PstdSeminarRegHeader."No."));


        CopyCommentLines(
        SeminarCommentLine."Table Name"::"Seminar Registration",
        SeminarCommentLine."Table Name"::"Posted Seminar
Registration", "No.",PstdSeminarRegHeader."No.");
CopyCharges("No.", PstdSeminarRegHeader."No.");

        LineCount := 0;
        SeminarRegLine.Reset;
        SeminarRegLine.SetRange("Document No.", "No.");
        if SeminarRegLine.FindSet then begin
            repeat
            until SeminarRegLine.Next = 0;
        end;

        Window.Update(2, LineCount);
        SeminarRegLine.TestField("Bill-to Customer No.");
        SeminarRegLine.TestField("Participant Contact No.");
        if not SeminarRegLine."To Invoice" then begin
            SeminarRegLine."Seminar Price" := 0;
            SeminarRegLine."Line Discount %" := 0;
            SeminarRegLine."Line Discount Amount" := 0;
            SeminarRegLine.Amount := 0;
        end;
        // Post seminar entry
        PostSeminarJnlLine(2); // Participant
                               // Insert posted seminar registration line
        PstdSeminarRegLine.Init;
        PstdSeminarRegLine.TransferFields(SeminarRegLine);
        PstdSeminarRegLine."Document No." :=
        PstdSeminarRegHeader."No.";
        PstdSeminarRegLine.Insert;

        // Post charges to seminar ledger
        PostCharges;
        // Post instructor to seminar ledger
        PostSeminarJnlLine(0); // Instructor
                               // Post seminar room to seminar ledger
        PostSeminarJnlLine(1); // Room

        Delete(true);
    end;
}
