page 50004 "Posted Seminar Registration"
{
    // Chapter 8 - Lab 2 - 4
    // Added Action Navigate
    ApplicationArea = All;
    Caption = 'Posted Seminar Registration';
    PageType = List;
    SourceTable = "Posted Seminar Registration";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Duration"; Rec."Duration")
                {
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ToolTip = 'Specifies the value of the Instructor Name field.';
                }
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ToolTip = 'Specifies the value of the Instructor Resource No. field.';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ToolTip = 'Specifies the value of the Maximum Participants field.';
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ToolTip = 'Specifies the value of the Minimum Participants field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ToolTip = 'Specifies the value of the Seminar Name field.';
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ToolTip = 'Specifies the value of the Seminar No. field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            repeater("Posted Lines")
            {
                
            }
            repeater("Seminar Room")
            {
            }
            repeater(Invoicing)
            {
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("&Navigate")
            {
                ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction();
                var
                    Navigate: page Navigate;
                begin
                    Navigate.SetDoc("Posting Date", "No.");
                    Navigate.RUN;
                end;
            }
        }
    }
    var
        PostedSeminarRegSubform: Record "Posted Seminar Reg. Subform";
}
