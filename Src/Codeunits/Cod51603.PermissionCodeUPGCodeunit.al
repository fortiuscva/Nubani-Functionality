codeunit 51603 "Permission Code UPG Codeunit"
{
    Subtype = Upgrade;

    trigger OnUpgradePerDatabase()
    begin
        PermissionCodesHandler.IntallPermissionCodes();
    end;

    var
        PermissionCodesHandler: Codeunit "NDS Permissions Codes Handler";

}
