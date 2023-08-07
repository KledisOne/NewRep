page 50128 "Example Line Subpage"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:  Document No., Line No., Example No., Line Date, Quantity, Example Description
    PageType = ListPart;
    Caption = 'Example Line Subpage';
    UsageCategory = None;
    SourceTable = ExampleLine;
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Editable = false;
                }
                field("Example No."; Rec."Example No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Example No. field.';
                }
                field("Line Date"; Rec."Line Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Date field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Example Description"; Rec."Example Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Example Description field.';
                }
            }
        }
    }
}