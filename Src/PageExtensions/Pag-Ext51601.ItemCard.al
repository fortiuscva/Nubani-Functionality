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
    begin
        UserPermissionHandler.GetVisibilityAndEditability(UserId, Database::Item, 'Unit Cost on Item Card', IsUnitCostVisible, IsUnitCostEditable);
        UserPermissionHandler.GetVisibilityAndEditability(UserId, Database::Item, 'Blocked on Item Card', IsBlockedVisible, IsBlockedEditable);
    end;

    var
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        IsUnitCostVisible: Boolean;
        IsUnitCostEditable: Boolean;
        IsBlockedVisible: Boolean;
        IsBlockedEditable: Boolean;
}
