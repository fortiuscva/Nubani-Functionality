pageextension 51601 "NDS Item Card" extends "Item Card"
{
    layout
    {
        modify("Unit Cost")
        {
            Visible = IsUnitCostvisible;
            Editable = IsUnitCostEditable;
        }
        modify(Blocked)
        {
            Visible = IsBlockedvisible;
            Editable = IsBlockedEditable;
        }

    }
    trigger OnOpenPage()
    var
        PermissionCode: Record "NDS Permission Code";
    begin
        PermissionCode.Reset();
        PermissionCode.SetRange("Page Id", page::"Item Card");
        if PermissionCode.FindSet() then
            repeat
                case PermissionCode.Code of
                    PermissionCodesHandler.GetUnitCostOnItemCard():
                        begin
                            UserPermissionHandler.ApplyUserPermissions(UserId, PermissionCode.Code, IsUnitCostvisible, IsUnitCostEditable);
                        end;
                    PermissionCodesHandler.GetBlockedonItemCard():
                        begin
                            UserPermissionHandler.ApplyUserPermissions(UserId, PermissionCode.Code, IsBlockedVisible, IsBlockedEditable);
                        end;

                end;
            until PermissionCode.Next() = 0;
    end;

    var
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        PermissionCodesHandler: Codeunit "NDS Permissions Codes Handler";

        IsUnitCostVisible: Boolean;
        IsUnitCostEditable: Boolean;
        IsBlockedVisible: Boolean;
        IsBlockedEditable: Boolean;
}
