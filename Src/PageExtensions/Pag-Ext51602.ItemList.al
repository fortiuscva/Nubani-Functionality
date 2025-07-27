pageextension 51602 "NDS Item List" extends "Item List"
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

    var
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        IsUnitCostVisible: Boolean;
        IsUnitCostEditable: Boolean;
        IsBlockedVisible: Boolean;
        IsBlockedEditable: Boolean;

}
