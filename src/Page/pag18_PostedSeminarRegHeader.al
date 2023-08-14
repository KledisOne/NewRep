table 50118 "CSD Posted Seminar Reg.Header"
{
    // CSD1.00 - 2023-08-07 - KGJ
    // Chapter 7 - Lab 3-1
    Caption = 'CSD Posted Seminar Reg.Header';
    DataClassification = CustomerContent;

    fields
    {
        field(4; "No."; Code[50])
        {
            Caption = 'No.';

        }
        field(5; "Instructor Code"; Code[50])
        {
            Caption = 'Instructor Code';

        }
        field(6; "Instructor Name"; Text[50])
        {
            CalcFormula = lookup(Resource.Name where("No." = field("Instructor Code"),
           Type = const(Person)));
            Editable = false;
            FieldClass = FlowField;

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
        }
        field(30; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
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


