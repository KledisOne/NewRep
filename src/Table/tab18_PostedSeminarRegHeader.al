table 50118 "CSD Posted Seminar Reg.Header"
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 3-1
    // Chapter 8 - Lab 2 - 3
    // Added LookupPageId & DrilldownPageId properties
    DataClassification = CustomerContent;
    Caption = 'Posted Seminar Reg. Header';
    LookupPageId = "Posted Seminar Reg. List";
    DrillDownPageId = "Posted Seminar Reg. List";

    fields
    {
        field(4; "No."; Code[50])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

        }
        field(5; "Instructor Code"; Code[50])
        {
            Caption = 'Instructor Code';
            DataClassification = CustomerContent;

        }
        field(6; "Instructor Name"; Text[50])
        {
            CalcFormula = lookup(Resource.Name where("No." = field("Instructor Code"),
           Type = const(Person)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Instructor Name';

        }
        field(7; "Posting Date"; Text[50])
        {

            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        Field(22; Comment; Boolean)
        {
            Caption = 'Comment';
            CalcFormula = Exist("CSD Seminar Comment Line" where
            ("Table Name" = const("Posted Seminar Reg. Header"), "No." = Field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "User Id"; Code[50])
        {
            Caption = 'User Id';
            TableRelation = User;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(30; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
            DataClassification = CustomerContent;
        }
        field(31; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            DataClassification = CustomerContent;
        }
        field(32; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Instructor Code")
        {
            Clustered = true;
        }
    }

}


