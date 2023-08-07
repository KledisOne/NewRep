pageextension 50100 "Customer Card" extends "Customer Card"
{
    // STR - CSD1.00 - 2023-08-07 - KGJ
    // Chapter 5 - Lab 1-2
    // Added new fields:
    // - RewardLevel
    // - RewardPoints 
    // - Social Media 
    // - Twitter
    // - Facebook
    // - LinkedIn
    // Added new FastTab Social Media
    // Added code to OnAfterGetRecord trigger
    // Added var RewardLevel

    layout
    {
        addafter(Name)
        {
            field(RewardLevel; RewardLevel)
            {
                ApplicationArea = All;
                Caption = 'Reward Level';
                Description = 'Reward level of the customer.';
                ToolTip = 'Specifies the level of reward that the customer has at this point.';
                Editable = false;
            }

            field(RewardPoints; Rec.RewardPoints)
            {
                ApplicationArea = All;
                Caption = 'Reward Points';
                Description = 'Reward points accrued by customer';
                ToolTip = 'Specifies the total number of points that the customer has at this point.';
                Editable = false;
            }
        }
        addafter(General)
        {
            group("Social Media")
            {
                Caption = 'Social Media';
                field(Instagram; Rec.Instagram)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Twitter field.';
                }

                field(Twitter; Rec.Twitter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Twitter field.';
                }
                field(Facebook; Rec.Facebook)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Facebook field.';
                }
                field(LinkedIn; Rec.LinkedIn)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LinkedIn field.';
                }

            }
        }

    }

    trigger OnAfterGetRecord();
    var
        CustomerRewardsMgtExt: Codeunit "Customer Rewards Ext Mgt";
    begin
        // Get the reward level associated with reward points 
        RewardLevel := CustomerRewardsMgtExt.GetRewardLevel(Rec.RewardPoints);
    end;

    var
        RewardLevel: Text;
}