table 50121 "CSD Posted Seminar Charge"
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 3-4

    Caption = 'CSD Posted Seminar Charge';
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
        field(9; "To invoice"; Boolean)
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
}
