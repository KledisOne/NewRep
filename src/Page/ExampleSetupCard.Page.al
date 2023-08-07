page 50140 ExampleSetupCard
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:  Example Nos., Document Nos.
    //Added code on trigger OnOpenPage
    ApplicationArea = All;
    Caption = 'Example Setup Card';
    PageType = Card;
    SourceTable = "Example Setup";
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Example Nos."; Rec."Example Nos.")
                {
                    ToolTip = 'Specifies the value of the Example Nos. field.';
                }
                field("Document Nos."; Rec."Document Nos.")
                {
                    ToolTip = 'Specifies the value of the Document Nos. field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not rec.get() then
            rec.Insert();
    end;
}