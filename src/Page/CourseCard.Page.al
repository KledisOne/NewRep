page 50117 "CRONUS Course Card"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:  Description, Name, Code, Duration, Price, Type, Active, Instructor Code, Instructor Name
    //New action: Resource Card
    PageType = Card;
    Caption = 'Course Card';
    SourceTable = "CRONUS Course";
    DelayedInsert = true;
    UsageCategory = None;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field(Difficulty; Rec.Difficulty)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Difficulty field.';
                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Instructor Code"; Rec."Instructor Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Passing Rate"; Rec."Passing Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Passing Rate field.';
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Resource Card")
            {
                ApplicationArea = All;
                Caption = 'Resource';
                ToolTip = 'Open the Resource Card';
                RunObject = page "Resource Card";
                RunPageLink = "No." = field("Instructor Code");
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
}