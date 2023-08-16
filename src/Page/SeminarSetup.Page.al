page 50010 "Seminar Setup"
{
    ApplicationArea = All;
    Caption = 'Seminar Setup';
    PageType = List;
    SourceTable = "CSD Seminar Setup";
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Posted Seminar Reg. Nos"; Rec."Posted Seminar Reg. Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Seminar Reg. Nos field.';
                }
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Seminar No. field.';
                }
                field("Seminar Registration No."; Rec."Seminar Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Seminar Registration Nos. field.';
                }
                
            }
        }
    }
}
