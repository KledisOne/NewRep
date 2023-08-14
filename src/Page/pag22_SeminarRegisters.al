page 50122 "CSD Seminar Registers"
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 2-11
    // Added new fields: 
    Caption = 'Seminar Registers';
    SourceTable = "CSD Seminar Register";
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                { }
                field("Creation Date"; "Creation Date")
                { }
                field("User ID"; "User ID")
                { }
                field("Source Code"; "Source Code")
                { }
                field("Journal Batch Name"; "Journal Batch")
                { }
            }

        }
        area(FactBoxes)
        {
            part("Record Links"; "Record Links")
            {
            }
            part("Notes"; "Notes")
            {
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action("Seminar Ledgers")
            {
                Image = WarrantyLedger;
                RunObject = codeunit "CSD Seminar Reg.-Show";
            }
        }
    }
}