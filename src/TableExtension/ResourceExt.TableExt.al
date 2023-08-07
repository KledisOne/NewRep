tableextension 50001 "CSD ResourceExt" extends Resource
{

    fields                                       // STR - CSD1.00 - 2023-08-07 - KGJ
    {
        field(50000; "Resource Type"; Option)
        {
            Caption = 'Resource Type';
            DataClassification = CustomerContent;
            OptionMembers = Any,One,Two;
        }
        field(50001; "Maximum Participants"; Decimal)
        {
            Caption = 'Maximum Participants';
            DataClassification = CustomerContent;
        }
        field(50101; "CSD Resource Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Internal","External";
            Caption = 'Resource Type';
            OptionCaption = 'Internal,External';
        }
        field(50102; "CSD Maximum Participants"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Maximum Participants';
        }
        field(50103; "CSD Quantity Per Day"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity Per Day';
        }

        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                Rec.TestField("Unit Cost");
            end;
        }
        modify(Type)
        {
            OptionCaption = 'Instructor, Room';    // END - CSD1.00 - 2023-08-07 - KGJ
        }
    }
}
