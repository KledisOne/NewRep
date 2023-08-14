codeunit 50103 "CSD SeminarPost"
{
    local procedure MyProcedure()
    var
        CSDPostedSeminarCharges: Record "CSD Posted Seminar Charges";
        SeminarCharge: Record "Seminar Charge";
    begin
        if SeminarCharge.Find() then
            repeat
                CSDPostedSeminarCharges."Bill-to Customer" := SeminarCharge."Bill-to Customer";
                CSDPostedSeminarCharges.Description := SeminarCharge.Description;
                CSDPostedSeminarCharges."Gen. Prod. Posting" := SeminarCharge."Gen. Prod. Posting";
                CSDPostedSeminarCharges."No." := SeminarCharge."No.";
                CSDPostedSeminarCharges.Quantity := SeminarCharge.Quantity;
                CSDPostedSeminarCharges."To invoice" := SeminarCharge."To invoice";
                CSDPostedSeminarCharges."Total Price" := SeminarCharge."Total Price";
                CSDPostedSeminarCharges."Unit of Measure" := SeminarCharge."Unit of Measure";
                CSDPostedSeminarCharges."Unit Price" := SeminarCharge."Unit Price";
                CSDPostedSeminarCharges.Insert();
            until SeminarCharge.Next() = 0;
    end;

    local procedure CopyCommentLines(FromDocumentType: Integer; ToDocumentType: Integer; FromNumber:
Code[20]; ToNumber: Code[20]);
    var
        SeminarCommentLine: Record SeminarCommentLine;
        SeminarCommentLine2: Record SeminarCommentLine;
    begin
        SeminarCommentLine.Reset;
        SeminarCommentLine.SetRange("Table Name",
        FromDocumentType);
        SeminarCommentLine.SetRange("No.", FromNumber);
        if SeminarCommentLine.FindSet then
            repeat
                SeminarCommentLine2 := SeminarCommentLine;
                SeminarCommentLine2."Table Name" := ToDocumentType;
                SeminarCommentLine2."No." := ToNumber;
                SeminarCommentLine2.Insert;
            until SeminarCommentLine.Next = 0;
    end;
}
