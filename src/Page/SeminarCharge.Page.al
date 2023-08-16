page 50008 "Seminar Charge"
{
    ApplicationArea = All;
    Caption = 'Seminar Charge';
    PageType = List;
    SourceTable = "Seminar Charge";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                
                field("Bill-to Customer"; Rec."Bill-to Customer")
                {
                    ToolTip = 'Specifies the value of the Bill-to Customer field.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Gen. Prod. Posting"; Rec."Gen. Prod. Posting")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("To invoice"; Rec."To invoice")
                {
                    ToolTip = 'Specifies the value of the To invoice field.';
                }
                field("Total Price"; Rec."Total Price")
                {
                    ToolTip = 'Specifies the value of the Total Price field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
            }
        }
    }
}
