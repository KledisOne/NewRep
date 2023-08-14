page 50002 "Seminar Register"
{
    // Chapter 7 - Lab 4-8
    // Added Action Post
    ApplicationArea = All;
    Caption = 'Seminar Register';
    PageType = List;
    SourceTable = "CSD Seminar Register";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field("Journal Batch"; Rec."Journal Batch")
                {
                    ToolTip = 'Specifies the value of the Journal Batch field.';
                }
                field("From Entry No."; Rec."From Entry No.")
                {
                    ToolTip = 'Specifies the value of the From Entry No. field.';
                }
                field("To. Entry No."; Rec."To. Entry No.")
                {
                    ToolTip = 'Specifies the value of the To. Entry No. field.';
                }

            }
        }

    }
    actions
    {
        area(Reporting)
        {
            action("&Post")
            {
                Caption = '&Post';
                Image = PostDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ShortcutKey = F9;
                RunObject = codeunit "CSD SeminarPost (Yes/No)";
            }
        }
    }
}
