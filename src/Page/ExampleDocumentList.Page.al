page 50130 "Example Document List"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:  No., Document Date, Posting Date, No. Printed
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ExampleHeader;
    Caption = 'Example Document List';
    Editable = false;
    CardPageId = "Example Document";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of Document Date.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
            }
        }
    }
}