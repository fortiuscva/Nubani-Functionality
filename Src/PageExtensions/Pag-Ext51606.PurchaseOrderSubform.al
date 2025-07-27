pageextension 51606 "NDS Purchase Order Subform" extends "Purchase Order Subform"
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
