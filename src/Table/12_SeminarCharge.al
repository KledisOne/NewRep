table 50113 "Seminar Charge"
{
    Caption = 'Seminar Charge';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; Quantity; Integer)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(4; "Unit of Measure"; Integer)
        {
            Caption = 'Unit of Measure';
            DataClassification = CustomerContent;
        }
        field(5; "Bill-to Customer"; Integer)
        {
            Caption = 'Bill-to Customer';
            DataClassification = CustomerContent;
        }
        field(6; "Gen. Prod. Posting"; Integer)
        {
            Caption = 'Gen. Prod. Posting';
            DataClassification = CustomerContent;
        }
        field(7; "Unit Price"; Integer)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }
        field(8; "Total Price"; Integer)
        {
            Caption = 'Total Price';
            DataClassification = CustomerContent;
        }
        field(9; "To invoice"; Integer)
        {
            Caption = 'To invoice';
            DataClassification = CustomerContent;
        }
        field(10; "Document No."; Code[20])
        {
            Caption = 'Document No.';
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

    local procedure CopyCharges(FromNumber: Code[20]; ToNumber: Code[20]);
    var
        PstdSeminarCharge: Record "CSD Posted Seminar Charge";
    begin
        Rec.Reset;
        Rec.SetRange("Document No.", FromNumber);
        if Rec.FindSet then
            repeat
                PstdSeminarCharge.TransferFields(Rec);
                PstdSeminarCharge."Document No." := ToNumber;
                PstdSeminarCharge.Insert;
            until Rec.Next = 0;
    end;

    local procedure PostCharges();
    var
    SeminarRegHeader: Record  SeminarRegistrationHeader;
    begin
        Rec.reset;
        Rec.SetRange("Document No.",
        SeminarRegHeader."No.");
        if Rec.FindSet(false, false) then
            repeat
                PostSeminarJnlLine(3); // Charge
            until Rec.next = 0;
    end;
}
