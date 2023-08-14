page 50005 "Seminar Registration List"
{
    // Chapter 7 - Lab 4-8
    // Added Action Post
    ApplicationArea = All;
    Caption = 'Seminar Registration List';
    PageType = Card;
    SourceTable = "Seminar Registration List";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

            }
        }

    }
    actions
    {
        area(Reporting)
        {
            action("&Post")
            {
                Caption = '&Post';
                Image = PostDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                ShortcutKey = F9;
                RunObject = codeunit "CSD SeminarPost (Yes/No)";
            }
        }
    }
}
