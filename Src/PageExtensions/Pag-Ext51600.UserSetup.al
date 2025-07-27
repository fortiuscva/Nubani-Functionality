pageextension 51600 "NDS User Setup" extends "User Setup"
{
    actions
    {
        addlast(Navigation)
        {
            group("NDS Permissions")
            {
                Caption = 'Permissions';
                action("NDS Permission Code's")
                {
                    ApplicationArea = All;
                    Caption = 'Permission Codes';
                    PromotedCategory = process;
                    Promoted = true;
                    PromotedOnly = true;
                    PromotedIsBig = true;
                    RunObject = Page "NDS User Permission Code's";
                    RunPageLink = "User ID" = FIELD("User ID");
                }
            }
        }
    }
}
