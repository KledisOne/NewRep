page 50102 "CSD Seminar Card"
// STR - CSD1.00 - 2023-08-07 - KGJ
// Chapter 5 - Lab 1-2
// Added new fields:  No., Name, Search Name, Seminar Duration, Minimum Participants, 
// Maximum Participants, Maximum Participants, Blocked, Last Date Modified
// Gen. Prod. Posting Group, VAT Prod. Posting Group, Seminar Price
// New action : Co&mments
{
    PageType = Card;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar Card';
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    AssistEdit = true;
                    trigger OnAssistEdit();
                    begin
                        if AssistEdit then
                            CurrPage.Update;
                    end;
                }
                field(Name; Rec.Name)
                {
                }
                field("Search Name"; Rec."Search Name")
                {
                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                }
                field("Seminar Price"; Rec."Seminar Price")
                {
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
        area(Navigation)
        {
            group("&Seminar")
            {
                action("Seminar Ledger Entries")
                {
                    RunObject = page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Caption = 'Seminar Ledger Entries';
                }
                action("Co&mments")
                {
                    RunObject = page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const(Seminar), "No." = field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Caption = 'Co&mments';
                }

                // >> Lab 8 1-2
                action("Ledger Entries")
                {
                    Caption = 'Ledger Entries';
                    RunObject = page "CSD Seminar Ledger Entries";
                    RunPageLink = "Seminar No." = field("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = "Ctrl+F7";
                    Image = WarrantyLedger;
                }
            }
            group(Registration)
            {
            }

            // >> Lab 8 1-2
            action("&Registrations")
            {
                Caption = '&Registrations';
                RunObject = page "Seminar Registration List";
                RunPageLink = "Seminar No." = field("No.");
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = Process;
            }
            // << Lab 8 1-2

            group("New Document Items")
            {
                action("Seminar Registration")
                {
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
        // >> Lab 8 1-2
        area(Processing)
        {
            action("Seminar Registration2")
            {
                RunObject = page "CSD Seminar Registers";
                RunPageLink = "Seminar No." = field("No.");
                RunPageMode = Create;
                Image = NewTimesheet;
                Promoted = true;
                PromotedCategory = New;
            }
        }
        // << Lab 8 1-2
    }
    var
        AssistEdit: Boolean;
}