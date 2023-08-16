page 50126 "Example List"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:  No., Description, Example Type Code
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Example;
    Caption = 'Example List';
    CardPageId = "Example Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Example Type Code"; Rec."Example Type Code")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
            }
        }
    }
}