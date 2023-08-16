page 50141 "Seminar Manager Activities"
// CSD1.00 - 2023-08-07 - KGJ
// Chapter 10 - Lab 1 - 2
// - Created new page
{
    PageType = CardPart;
    SourceTable = "CSD Seminar Cue";
    Caption = 'Seminar Manager Activities';
    layout
    {
        area(content)
        {
            cuegroup(Registrations)
            {
                Caption = 'Registrations';
                field(Planned; Planned)
                {
                }
                field(Registered; Registered)
                {
                }
                actions
                {
                    action(New)
                    {
                        Caption = 'New';
                        RunObject = page "CSD Seminar Registers";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("For Posting")
            {
                field(Closed; Closed)
                {
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        if not get then begin
            init;
            insert;
        end;
    end;
}