page 50004 "Posted Seminar Registration"
{
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
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ToolTip = 'Specifies the value of the Seminar No. field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ToolTip = 'Specifies the value of the Seminar Name field.';
                }
                field("Duration"; Rec."Duration")
                {
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ToolTip = 'Specifies the value of the Instructor Resource No. field.';
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ToolTip = 'Specifies the value of the Instructor Name field.';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ToolTip = 'Specifies the value of the Maximum Participants field.';
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ToolTip = 'Specifies the value of the Minimum Participants field.';
                }
            }
            repeater("Posted Lines")
            {
                field("Bill-to Customer"; PostedSeminarRegSubform."Bill-to Customer")
                {
                    ToolTip = 'Specifies the value of the Minimum Participants field.';
                }
                field("Participant Contact No."; PostedSeminarRegSubform."Participant Contact No.")
                {
                    ToolTip = 'Specifies the value of the Minimum Participants field.';
                }
                field("Participant Name"; PostedSeminarRegSubform."Participant Name")
                {
                    ToolTip = 'Specifies the value of the Minimum Participants field.';
                }
                field("Registration Date"; PostedSeminarRegSubform."Registration Date")
                {
                    ToolTip = 'Specifies the value of the Minimum Participants field.';
                }
                field("Confirmation Date"; PostedSeminarRegSubform."Confirmation Date")
                {
                    ToolTip = 'Specifies the value of the Minimum Participants field.';
                }
                field("To Invoice"; PostedSeminarRegSubform."To Invoice")
                {
                    ToolTip = 'Specifies the value of the Minimum Participants field.';
                }
            }
            repeater("Seminar Room")
            {
            }
            repeater(Invoicing)
            {
            }
        }
    }
    var
        PostedSeminarRegSubform: Record "Posted Seminar Reg. Subform";
}
