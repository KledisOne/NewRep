table 50110 SeminarRegistration
{
    Caption = 'SeminarRegistration';
    DataClassification = CustomerContent;

    fields
    {
        field(5; "Instructor Code"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Instructor Code';

        }
        field(6; "Instructor Name"; Text[50])
        {
            CalcFormula = lookup(Resource.Name where("No." = field("Instructor Code"),
           Type = const(Person)));
            Editable = false;
            FieldClass = FlowField;

        }
    }

    keys
    {
        key(Key1; "Instructor Code")
        {
            Clustered = true;
        }
    }
    var
        Text002: TextConst ENU = 'You cannont change the %1, ';

}