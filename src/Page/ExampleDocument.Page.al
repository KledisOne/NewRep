page 50127 "Example Document"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:  No., Document Date, Posting Date, No. Printed
    //Added new part : ExampleLineSubpage
    PageType = Document;
    UsageCategory = Documents;
    SourceTable = ExampleHeader;
    Caption = 'Example Document';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of Document Date.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                
            }
            part(ExampleLineSubpage; "Example Line Subpage")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = All;
            }
        }
    }
}