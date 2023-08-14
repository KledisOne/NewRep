table 50104 "CSD Seminar"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields: No., Name, Seminar Duration, Minimum Participants,
    //  Maximum Participants, Search Name, Blocked, Last Date Modified, Comment,
    // Seminar Price, Gen. Prod. Posting Group, VAT Prod. Posting Group, No. Series
    //Added variables : SeminarSetup, Seminar, GenProdPostingGroup, NoSeriesMgt
    //Added code on OnInsert, OnModify , OnRename, OnDelete trigger 
    //Added code to Onvalidate trigger of No.
    //Added code to Onvalidate trigger of Name
    //Added code to Onvalidate trigger of Gen. Prod. Posting Group
    //Added new procedure AssistEdit
    Caption = 'Seminar';
    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.GET;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20; Name; Text[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or
                ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 1;
        }
        field(40; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = CustomerContent;
        }
        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = CustomerContent;
        }
        field(60; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
            DataClassification = CustomerContent;
        }
        field(70; Blocked; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = CustomerContent;
        }
        field(80; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90; Comment; Boolean)
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
            Editable = false;
            //FieldClass=FlowField;
            //CalcFormula=exist("Seminar Comment Line"
            //where("Table Name"= const("Seminar"),
            // "No."=Field("No.")));
        }
        field(100; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            DataClassification = CustomerContent;
            AutoFormatType = 1;
        }
        field(110; "Gen. Prod. Posting Group"; code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate();
            begin
                if (xRec."Gen. Prod. Posting Group" <>
                "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup
                    (GenProdPostingGroup, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",
                        GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120; "VAT Prod. Posting Group"; code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "VAT Product Posting Group";
        }
        field(130; "No. Series"; Code[10])
        {
            Editable = false;
            Caption = 'No. Series';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key1; "Search Name")
        {
        }
    }
    var
        SeminarSetup: Record "CSD Seminar Setup";
        //CommentLine : record "CSD Seminar Comment Line";
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar No.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar No.", xRec."No. Series",
            0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete();
    begin
        //CommentLine.Reset;
        //CommentLine.SetRange("Table Name",
        //CommentLine."Table Name"::Seminar);
        //CommentLine.SetRange("No.","No.");
        // CommentLine.DeleteAll;
    end;

    procedure AssistEdit(): Boolean;
    begin
        with Seminar do begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar No.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar No."
            , xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
}


