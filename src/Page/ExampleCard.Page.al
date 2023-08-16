page 50125 "Example Card"
 {
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:  No., Description, Example Type Code
     PageType = Card;
     UsageCategory = None;
     SourceTable = Example;
     Caption = 'Example Card';


     layout
     {
         area(Content)
         {
             group(General)
             {
                 Caption = 'General';
                 field(Description; Rec.Description)
                 {
                     ApplicationArea = All;
                     ToolTip = 'Specifies the value of the Instructor Code field.';
                 }
                 field("Example Type Code"; Rec."Example Type Code")
                 {
                     ApplicationArea = All;
                     ToolTip = 'Specifies the value of the Instructor Code field.';
                 }
                 field("No."; Rec."No.")
                 {
                     ApplicationArea = All;
                     ToolTip = 'Specifies the value of the Instructor Code field.';
                 }
                 field("No. Series"; Rec."No. Series")
                 {
                     ApplicationArea = All;
                     ToolTip = 'Specifies the value of the No. field.';
                 }
             }
         }
     }
 }