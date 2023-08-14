tableextension 50002 "Res. Journal Line Ext" extends "Res. Journal Line"
{
    fields
    {
        field(50000; "Seminar No."; Text[100])
        {
            Caption = 'Seminar No';
            DataClassification = CustomerContent;
        }
        field(50001; "CSD Seminar Registration No."; Code[50])
        {
            Caption = 'CSD Seminar Registration No.';
            DataClassification = CustomerContent;
        }
    }
}
