pageextension 51604 "NDS Sales Quote Subform" extends "Sales Quote Subform"
{
    layout
    {
        modify("Unit Cost (LCY)")
        {
            Visible = IsUnitCostLCYVisible;
            Editable = IsUnitCostLCYEditable;
        }
    }

    var
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        IsUnitCostLCYVisible: Boolean;
        IsUnitCostLCYEditable: Boolean;

}
