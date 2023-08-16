page 50122 "CSD Seminar Registers"
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 2-11
    // Added new fields: 
    // Chapter 7 - Lab 4-8
    // Added Action Post
    Caption = 'Seminar Register';
    SourceTable = "CSD Seminar Register";
    Editable = false;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field("No."; "No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Instructor Code"; Rec."Instructor Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Name field.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Printed field.';
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Seminar No. field.';
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Source Code"; "Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Journal Batch Name"; "Journal Batch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
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
        area(FactBoxes)
        {
            // part("Record Links"; "Record Links")
            // {
            // }
            // part("Notes"; "Notes")
            // {
            // }
        }
    }
    actions
    {
        area(Navigation)
        {
            action("Seminar Ledgers")
            {
                Image = WarrantyLedger;
                RunObject = codeunit "CSD Seminar Reg.-Show";
                ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
            }
            // action("&Print")
            // {
            //     Caption = '&Print';
            //     Image = Print;
            //     Promoted = true;
            //     PromotedIsBig = true;
            //     PromotedCategory = Process;
            //     trigger OnAction();
            //     var
            //         SeminarReportSelection: Record "CSD Seminar Report Selections";
            //     begin
            //         SeminarReportSelection.PrintReportSelection
            //         (SeminarReportSelection.Usage::Registration, Rec);
            //     end;
            // }
        }
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
                ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
            }
        }
    }
}