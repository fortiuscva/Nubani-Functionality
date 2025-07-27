codeunit 51600 "NDS User Permissions Handler"
{
    procedure GetVisibilityAndEditability(UserID: Code[50]; TableId: Integer; PermissionCode: Text; var IsVisible: Boolean; var IsEditable: Boolean)
    var
        PermissionCodeRec: Record "NDS Permission Code";
        PermMatrixRec: Record "NDS User Permission Code's";
    begin
        IsVisible := true;
        IsEditable := true;
        PermissionCodeRec.SetRange(Code, PermissionCode);
        PermissionCodeRec.SetRange("Table Id", TableId);
        if PermissionCodeRec.FindFirst() then
            if PermMatrixRec.Get(UserID, PermissionCode) then begin
                IsVisible := PermMatrixRec.Visible;
                IsEditable := PermMatrixRec.Editable;
            end;
    end;
}
