page 50106 "CSD Seminar Comment Sheet"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:  Date, Code, Comment
    Caption = 'Seminar Comment Sheet';
    PageType = List;
    Editable = false;
    SourceTable = "CSD Seminar Comment Line";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                }
                field(Code; Rec.Code)
                {
                    Visible = false;
                }
                field(Comment; Rec.Comment)
                {
                }
            }
        }
    }
}