codeunit 51600 "NDS User Permissions Handler"
{
    procedure GetVisibilityAndEditability(UserID: Code[50]; PageId: Integer; PermissionCode: Text; var IsVisible: Boolean; var IsEditable: Boolean)
    var
        PermissionCodeRec: Record "NDS Permission Code";
        PermMatrixRec: Record "NDS User Permission Codes";
    begin
        IsVisible := true;
        IsEditable := true;
        PermissionCodeRec.SetRange(Code, PermissionCode);
        PermissionCodeRec.SetRange("Page ID", PageId);
        if PermissionCodeRec.FindFirst() then
            if PermMatrixRec.Get(UserID, PermissionCode) then begin
                IsVisible := PermMatrixRec.Visible;
                IsEditable := PermMatrixRec.Editable;
            end;
    end;

    procedure ApplyUserPermissions(UserIDPar: Code[50]; PermissionCodePar: Code[100]; Var VisiblePar: Boolean; Var EditablePar: Boolean)
    var
        UserPermissioncodes: Record "NDS User Permission Codes";
    begin
        UserPermissioncodes.Reset();
        UserPermissioncodes.SetRange("User ID", UserIDPar);
        UserPermissioncodes.SetRange("Permission Code", PermissionCodePar);
        if UserPermissioncodes.FindFirst() then begin
            VisiblePar := UserPermissioncodes.Visible;
            EditablePar := UserPermissioncodes.Editable;
        end;
    end;


}
