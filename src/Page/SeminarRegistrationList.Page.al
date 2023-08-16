page 50005 "Seminar Registration List"
{
    // Chapter 7 - Lab 4-8
    // Added Action Post
    ApplicationArea = All;
    Caption = 'Seminar Registration List';
    PageType = Card;
    SourceTable = "Seminar Registration List";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';


                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Seminar No. field.';
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
                ApplicationArea = All;
                Caption = '&Post';
                Image = PostDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ShortcutKey = F9;
                RunObject = codeunit "CSD SeminarPost (Yes/No)";
            }
        }
        area(Navigation)
        {
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
    }
}
