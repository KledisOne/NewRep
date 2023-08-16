page 50103 "CSD Seminar List"
// STR - CSD1.00 - 2023-08-07 - KGJ
// Chapter 5 - Lab 1-2
// Added new fields:  No., Name, Seminar Duration, Seminar Price, Minimum Participants
// Maximum Participants
// Added new action : Co&mments
{
    Caption = 'Seminar List';
    PageType = List;
    SourceTable = "CSD Seminar";
    Editable = false;
    CardPageId = 50010;
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ToolTip = 'Specifies the value of the Search Name field.';
                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ToolTip = 'Specifies the value of the Instructor Code field.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart("Links"; Links)
            {
            }
            systempart("Notes"; Notes)
            {
            }
        }
    }
    actions
    {
        area(Creation)
        {
            group("&Seminar")
            {
                Caption = 'Seminar';

                action("Seminar Ledger Entries")
                {
                    RunObject = page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    ApplicationArea = All;
                    PromotedCategory = Process;
                    Caption = 'Seminar Ledger Entries';
                }
                action("Co&mments")
                {
                    Promoted = true;
                    ApplicationArea = All;
                    RunObject = page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Caption = 'Co&mments';
                    ToolTip = '123';
                    Enabled = true;

                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        Message('123');
                    end;
                }
            }
            group(Registration)
            {
                // >> Lab 8-2
                action("Ledger Entries")
                {
                    ApplicationArea = All;
                    RunObject = page "CSD Seminar Ledger Entries";
                    RunPageLink = "Seminar No." = field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = "Ctrl+F7";
                    Image = WarrantyLedger;
                }
                action("&Registrations")
                {
                    ApplicationArea = All;
                    RunObject = page "Seminar Registration List";
                    // RunPageLink = "Seminar No." = field("No.");
                    Image = Timesheet;
                    PromotedCategory = Process;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Caption = 'Registrations';
                }
                // << Lab 8-2
            }
            group("New Document Items")
            {
                action("Seminar Registration")
                {

                    ApplicationArea = All;
                    RunObject = page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Caption = 'Seminar Registration';
                }
            }
        }
        area(Processing)
        {
            action("Seminar Registration2")
            {
                ApplicationArea = All;
                RunObject = page "CSD Seminar Registers";
                RunPageLink = "Seminar No." = field("No.");
                RunPageMode = Create;
                Image = NewTimesheet;
                Promoted = true;
                PromotedCategory = New;
            }
        }
    }
}