pageextension 51605 "NDS Sales Lines" extends "Sales Lines"
{
    layout
    {
        // modify(Dire)
        // {
        //     Visible = IsUnitCostLCYVisible;
        //     Editable = IsUnitCostLCYEditable;
        // }
    }

    var
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        IsUnitCostLCYVisible: Boolean;
        IsUnitCostLCYEditable: Boolean;

}
