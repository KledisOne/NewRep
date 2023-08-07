pageextension 50114 CustomerList extends "Customer List"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new action:
    // - Reward Levels
    // Added code to OnOpenPage trigger
    actions
    {
        addfirst("&Customer")
        {
            action("Reward Levels")
            {
                ApplicationArea = All;
                Image = CustomerRating;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Open the list of reward levels.';

                trigger OnAction();
                var
                    CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext Mgt";
                begin
                    if CustomerRewardsExtMgt.IsCustomerRewardsActivated then
                        CustomerRewardsExtMgt.OpenRewardsLevelPage
                    else
                        CustomerRewardsExtMgt.OpenCustomerRewardsWizard;
                end;
            }
        }
    }
    trigger OnOpenPage();
    begin
        report.Run(Report::LABCustomerList);
    end;
}