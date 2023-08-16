page 50011 "Customer Rewards Mgt Setup"
{
    ApplicationArea = All;
    Caption = 'Customer Rewards Mgt Setup';
    PageType = List;
    SourceTable = "Customer Rewards Mgt Setup";
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                
                field("Cust. Rew. Ext. Mgt. Cod. ID"; Rec."Cust. Rew. Ext. Mgt. Cod. ID")
                {
                    ToolTip = 'Specifies the value of the Customer Rewards Ext. Mgt. Codeunit ID field.';
                }
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
            }
        }
    }
}
