page 50118 "CRONUS Course List"
{
    PageType = List;
    Caption = 'Course List';
    SourceTable = "CRONUS Course";
    DelayedInsert = true;
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = false;
    CardPageId = "CRONUS Course Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    Caption = 'Code';
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = All;

                }
                field(Price; Rec.Price)
                {
                    Caption = 'Price';
                    ApplicationArea = All;

                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    Caption = 'Instructor Name';
                    ApplicationArea = All;

                }
            }
        }
    }
}