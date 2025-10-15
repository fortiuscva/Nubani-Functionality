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
            Visible = IsDirectUnitCostVisible;
            Editable = IsDirectUnitCostEditable;
        }
        modify("Qty. to Receive")
        {
            trigger OnBeforeValidate()
            begin
                NDSSingleInstance.SetSuppressWhseMgmtWarningMsg(true);
            end;
            // There is an subsriber added to codeunit 51603 to suppress warehouse mgmt warning.
            trigger OnAfterValidate()
            begin
                NDSSingleInstance.SetSuppressWhseMgmtWarningMsg(false);
            end;
        }
    }
    trigger OnOpenPage()
    var
        PermissionCode: Record "NDS Permission Code";
    begin
        PermissionCode.Reset();
        PermissionCode.SetRange("Page Id", page::"Purchase Order Subform");
        if PermissionCode.FindSet() then
            repeat
                case PermissionCode.Code of
                    PermissionCodesHandler.GetDirectUnitCostOnPurchaseOrderSubform():
                        begin
                            UserPermissionHandler.ApplyUserPermissions(UserId, PermissionCode.Code, IsDirectUnitCostVisible, IsDirectUnitCostEditable);
                        end;
                    PermissionCodesHandler.GetUnitCostLCYOnPurchaseOrderSubform():
                        begin
                            UserPermissionHandler.ApplyUserPermissions(UserId, PermissionCode.Code, IsUnitCostLCYVisible, IsUnitCostLCYEditable);
                        end;
                end;
            until PermissionCode.Next() = 0;
    end;

    var
        NDSSingleInstance: Codeunit "NDS Single Instance";
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        PermissionCodesHandler: Codeunit "NDS Permissions Codes Handler";
        IsUnitCostLCYVisible: Boolean;
        IsUnitCostLCYEditable: Boolean;
        IsDirectUnitCostVisible: Boolean;
        IsDirectUnitCostEditable: Boolean;

}
