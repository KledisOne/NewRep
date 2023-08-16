table 50140 "CSD Seminar Cue"
// CSD1.00 - 2023-08-07 - KGJ
// Chapter 10 - Lab 1 - 1
// - Created new page
{
    DataClassification = CustomerContent;
    Caption = 'Seminar Cue';
    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(20; Planned; Integer)
        {
            Caption = 'Planned';
            FieldClass = FlowField;
            CalcFormula = Count(SeminarRegistrationHeader where(Status = const(Planning)));
        }
        field(30; Registered; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Registered';
            CalcFormula = Count(SeminarRegistrationHeader where(Status = const(Registration)));
        }
        field(40; Closed; Integer)
        {
            Caption = 'Closed';
            FieldClass = FlowField;
            CalcFormula = Count(SeminarRegistrationHeader where(Status = const(Closed)));
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}