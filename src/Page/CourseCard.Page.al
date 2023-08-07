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
                field(Description; Rec.Description)
                {
                    Caption = 'fieldCaption';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    Caption = 'Code';
                    ApplicationArea = All;
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field(Duration; Rec.Duration)
                {
                    Caption = 'Duration';
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    Caption = 'Price';
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    Caption = 'Type';
                    ApplicationArea = All;
                }
                field(Active; Rec.Active)
                {
                    Caption = 'Active';
                    ApplicationArea = All;
                }
                field("Instructor Code"; Rec."Instructor Code")
                {
                    Caption = 'Instructor Code';
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