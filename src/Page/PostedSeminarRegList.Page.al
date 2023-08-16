page 50003 "Posted Seminar Reg. List"
{
    ApplicationArea = All;
    Caption = 'Posted Seminar Reg. List';
    PageType = List;
    SourceTable = "Posted Seminar Reg. List";
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                
                field("Duration"; Rec."Duration")
                {
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Maximum Participant"; Rec."Maximum Participant")
                {
                    ToolTip = 'Specifies the value of the Maximum Participant field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Room Resource"; Rec."Room Resource")
                {
                    ToolTip = 'Specifies the value of the Room Resource field.';
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
        }
    }
}
