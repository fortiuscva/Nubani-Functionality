pageextension 51607 "NDS Purchase Lines" extends "Purchase Lines"
{
    layout
    {
        modify("Unit Cost (LCY)")
        {
            Visible = IsUnitCostLCYVisible;
            Editable = IsUnitCostLCYEditable;
        }
        modify("Direct Unit Cost")
        {
            Visible = IsDirectUnitVisible;
            Editable = IsDirectUnitEditable;
        }
    }
    var
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        IsUnitCostLCYVisible: Boolean;
        IsUnitCostLCYEditable: Boolean;
        IsDirectUnitVisible: Boolean;
        IsDirectUnitEditable: Boolean;

}
