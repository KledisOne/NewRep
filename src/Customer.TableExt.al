tableextension 50110 Customer extends Customer
{
    fields
    {
        field(10001; RewardPoints; Integer)
        {
            Caption = 'Reward Points';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
        field(50110; Facebook; Text[50])
        {
            Caption = 'Facebook';
            DataClassification = CustomerContent;
        }
        field(50111; Twitter; Text[30])
        {
            Caption = 'Twitter';
            DataClassification = CustomerContent;
        }
        field(50112; Instagram; Text[50])
        {
            Caption = 'Twitter';
            DataClassification = CustomerContent;
        }
        field(50113; LinkedIn; Text[50])
        {
            Caption = 'LinkedIn';
            DataClassification = CustomerContent;
        }
    }
}