page 50012 "Posted Seminar Reg. Line"
{
    ApplicationArea = All;
    Caption = 'Posted Seminar Reg. Line';
    PageType = List;
    SourceTable = "CSD Posted Seminar Reg. Line";
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
            }
        }
    }
}
