pageextension 50002 ResourceListExt extends "Resource List"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:
    // - Resource Type
    // - Maximum Participants
    // Added new FastTab
    // Added code to OnOpenPage trigger
    // Added code to OnValidate trigger of Resource Type
    // Added code to OnValidate trigger of Maximum Participants
    // Added VAR FieldVisible, FieldVisibleV2
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }
        addafter(Type)
        {
            field("CSD Resource Type"; Rec."CSD Resource Type")
            {
            }
            field("CSD Maximum Participants"; Rec."CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
        addafter(Name)
        {

            field("Resource Type"; Rec."Resource Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Resource Type field.';
                Editable = FieldVisible;
                trigger OnValidate()
                begin
                    FieldVisible := false;
                    if Rec.findset() then
                        repeat
                            if Rec."Resource Type" <> ' ' then
                                FieldVisible := true;
                        until Rec.next() = 0;
                end;
            }
            field("Maximum Participants"; Rec."Maximum Participants")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Maximum Participants field.';
                trigger OnValidate()
                begin
                    FieldVisibleV2 := false;
                    if Rec.findset() then
                        repeat
                            if Rec."Resource Type" <> Rec.Type::Person then
                                FieldVisibleV2 := true;
                        until Rec.next() = 0;
                end;
            }
        }
    }
    trigger OnOpenPage();
    begin
        ShowType := (Rec.GetFilter(Type) = '');
        ShowMaxField :=
       (Rec.GetFilter(Type) = format(Rec.Type::machine));
    end;

    var
        [InDataSet]
        ShowType: Boolean;
        [InDataSet]
        ShowMaxField: Boolean;
        FieldVisible: Boolean;
        FieldVisibleV2: Boolean;

}
