page 50118 "CRONUS Course List"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:  Code, Name, Description, Price, Instructor Name
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
                
                field(Active; Rec.Active)
                {
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field(Difficulty; Rec.Difficulty)
                {
                    ToolTip = 'Specifies the value of the Difficulty field.';
                }
                field("Duration"; Rec."Duration")
                {
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Instructor Code"; Rec."Instructor Code")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Passing Rate"; Rec."Passing Rate")
                {
                    ToolTip = 'Specifies the value of the Passing Rate field.';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
    }
}