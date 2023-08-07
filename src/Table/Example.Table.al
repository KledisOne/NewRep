table 50125 Example
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields: No., Description, Example Type Code, No. Series
    // Added code on trriger OnInsert, AssistEdit
    DataClassification = CustomerContent;
    Caption = 'Example';
    LookupPageId = "Example List";
    DrillDownPageId = "Example List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(3; "Example Type Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Example Type Code';
            TableRelation = ExampleType;
        }
        field(4; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
    }

    keys
    {
        key(Pk; "No.")
        {
            Clustered = true;
        }
    }
    var
        ExampleSetup: Record "Example Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            ExampleSetup.Get();
            ExampleSetup.TestField("Example Nos.");
            NoSeriesManagement.InitSeries(ExampleSetup."Example Nos.",
                                        xRec."No. Series",
                                        0D,
                                        "No.",
                                        "No. Series");
        end;
    end;

    procedure AssistEdit(OldExample: Record Example): Boolean
    var
        Example: Record Example;
    begin
        Example := Rec;
        ExampleSetup.Get();
        ExampleSetup.TestField("Example Nos.");
        if NoSeriesManagement.SelectSeries(ExampleSetup."Example Nos.",
                                        OldExample."No. Series",
                                        Example."No. Series") then begin
            NoSeriesManagement.SetSeries(Example."No.");
            Rec := Example;
            exit(true);
        end;
    end;
}