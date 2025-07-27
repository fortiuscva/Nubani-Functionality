pageextension 51611 "NDS Posted Purchase Inv. Lines" extends "Posted Purchase Invoice Lines"
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
            Visible = IsDirectUnitCostVisible;
            Editable = IsDirectUnitCostEditable;
        }
    }

    trigger OnOpenPage()
    var
        PermissionCode: Record "NDS Permission Code";
    begin
        PermissionCode.Reset();
        PermissionCode.SetRange("Page Id", page::"Posted Purchase Invoice Lines");
        if PermissionCode.FindSet() then
            repeat
                case PermissionCode.Code of
                    PermissionCodesHandler.GetDirectUnitCostOnPostedPurchaseInvoiceLines():
                        begin
                            UserPermissionHandler.ApplyUserPermissions(UserId, PermissionCode.Code, IsDirectUnitCostVisible, IsDirectUnitCostEditable);
                        end;
                    PermissionCodesHandler.GetUnitCostLCYOnPostedPurchaseInvoiceLines():
                        begin
                            UserPermissionHandler.ApplyUserPermissions(UserId, PermissionCode.Code, IsUnitCostLCYVisible, IsUnitCostLCYEditable);
                        end;
                end;
            until PermissionCode.Next() = 0;
    end;


    var
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        PermissionCodesHandler: Codeunit "NDS Permissions Codes Handler";
        IsUnitCostLCYVisible: Boolean;
        IsUnitCostLCYEditable: Boolean;
        IsDirectUnitCostVisible: Boolean;
        IsDirectUnitCostEditable: Boolean;

}
