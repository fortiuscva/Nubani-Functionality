pageextension 51600 "NDS User Setup" extends "User Setup"
{
    actions
    {
        addlast(Navigation)
        {
            group("NDS Permissions")
            {
                Caption = 'Permissions';
                action("NDS Permission Codes")
                {
                    ApplicationArea = All;
                    Caption = 'Permission Codes';
                    PromotedCategory = process;
                    Promoted = true;
                    PromotedOnly = true;
                    PromotedIsBig = true;
                    RunObject = Page "NDS User Permission Codes";
                    RunPageLink = "User ID" = FIELD("User ID");
                }
                action("NDS Load Permission Codes")
                {
                    ApplicationArea = All;
                    Caption = 'Load Permission Codes';
                    PromotedCategory = process;
                    Promoted = true;
                    PromotedOnly = true;
                    PromotedIsBig = true;
                    trigger OnAction()
                    var
                        PermissionCodesHandler: Codeunit "NDS Permissions Codes Handler";
                    begin
                        PermissionCodesHandler.IntallPermissionCodes();
                    end;
                }
            }
        }
    }
}
