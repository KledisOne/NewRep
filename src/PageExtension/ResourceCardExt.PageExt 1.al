pageextension 50003 ResourceCardExt extends "Resource Card"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:
    // - Internal/External
    // - Maximum Participants
    // Added new FastTab
    // Added code to OnOpenPage trigger

    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; Rec."CSD Resource Type")
            {
            }
            field("CSD Quantity Per Day"; Rec."CSD Quantity Per Day")
            {
            }
        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowMaxField;
                field("CSD Maximum Participants"; Rec."Maximum Participants")
                {
                }
            }
        }
    }
    trigger OnAfterGetRecord();
    begin
        ShowMaxField := (Rec.Type = Rec.Type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;                                  // END - CSD1.00 - 2023-08-07 - KGJ
}
