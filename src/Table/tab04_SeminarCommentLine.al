table 50105 "CSD Seminar Comment Line"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 2-1
    // Chapter 7 - Lab 3-2
    Caption = 'Seminar Comment Line';
    LookupPageId = "CSD Seminar Comment List";
    DrillDownPageId = "CSD Seminar Comment List";
    fields
    {
        field(10; "Table Name"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Table Name';
            OptionMembers = "Seminar","Seminar Registration Header","Posted Seminar Reg. Header";
            OptionCaption = 'Seminar,Seminar Registration, Posted Seminar Registration';
        }
        field(20; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
            DataClassification = CustomerContent;
        }
        field(30; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if ("Table Name" = CONST(Seminar)) "CSD Seminar"
            else
            if ("Table Name" = const(Seminar)) "CSD Posted Seminar Reg.Header"
            else
            if ("Table Name" = const("Posted Seminar Reg. Header")) "SeminarRegistrationHeader";
        }
        field(40; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(50; Date; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(60; Code; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(70; Comment; Text[80])
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Table Name", "Document Line No.", "No.", "Line No.")
        {
            Clustered = true;
        }
    }
}