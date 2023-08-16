page 50002 SeminarCommentLine
{
    ApplicationArea = All;
    Caption = 'SeminarCommentLine';
    PageType = List;
    SourceTable = "CSD Seminar Comment Line";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                
               
                
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Table Name"; Rec."Table Name")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
            }
        }
    }
}
