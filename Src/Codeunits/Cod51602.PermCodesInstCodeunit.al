codeunit 51602 "NDS Perm. Codes Inst. Codeunit"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        // Company-specific setup logic
    end;

    trigger OnInstallAppPerDatabase()
    var
        myAppInfo: ModuleInfo;
    begin
        // NavApp.GetCurrentModuleInfo(myAppInfo);
        // if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
        //     HandleFreshInstall()
        // else
        //     HandleReinstall();
        HandleReinstall();
    end;

    local procedure HandleFreshInstall()
    begin
        // Logic for first-time install
    end;

    local procedure HandleReinstall()
    begin
        PermissionCodesHandler.IntallPermissionCodes();
    end;

    var
        PermissionCodesHandler: Codeunit "NDS Permissions Codes Handler";

}
