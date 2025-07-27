pageextension 51603 "NDS Item Ledger Entries." extends "Item Ledger Entries"
{
    layout
    {
        // modify(Dire)
        // {
        //     Visible = IsUnitCostvisible;
        //     Editable = IsUnitCostEditable;
        // }


    }

    var
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        IsUnitCostVisible: Boolean;
        IsUnitCostEditable: Boolean;

}