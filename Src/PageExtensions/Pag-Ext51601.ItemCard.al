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
        RecRef: RecordRef;
        TableId: Integer;
    begin
        RecRef.GetTable(Rec);
        TableId := RecRef.Number;
        UserPermissionHandler.GetVisibilityAndEditability(UserId(), TableId, 'Unit Cost on Item Card', IsUnitCostVisible, IsUnitCostEditable);
        UserPermissionHandler.GetVisibilityAndEditability(UserId, TableId, 'Blocked on Item Card', IsBlockedVisible, IsBlockedEditable);
    end;

    var
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        IsUnitCostVisible: Boolean;
        IsUnitCostEditable: Boolean;
        IsBlockedVisible: Boolean;
        IsBlockedEditable: Boolean;
}
