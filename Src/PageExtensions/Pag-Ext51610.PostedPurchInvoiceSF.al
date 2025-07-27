pageextension 51610 "NDS Posted Purch. Invoice SF" extends "Posted Purch. Invoice Subform"
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
