page 50106 "CSD Seminar Comment Sheet"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:  Date, Code, Comment
    Caption = 'Seminar Comment Sheet';
    PageType = List;
    Editable = false;
    SourceTable = "CSD Seminar Comment Line";
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
               
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Table Name"; Rec."Table Name")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
            }
        }
    }
}