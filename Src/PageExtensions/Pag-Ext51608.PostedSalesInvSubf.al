pageextension 51608 "NDS Posted Sales Inv. Subf" extends "Posted Sales Invoice Subform"
{
    layout
    {
        modify("Unit Cost (LCY)")
        {
            Visible = IsUnitCostLCYVisible;
            Editable = IsUnitCostLCYEditable;
        }
    }

    trigger OnOpenPage()
    var
        PermissionCode: Record "NDS Permission Code";
    begin
        PermissionCode.Reset();
        PermissionCode.SetRange("Page Id", page::"Posted Sales Invoice Subform");
        if PermissionCode.FindSet() then
            repeat
                case PermissionCode.Code of
                    PermissionCodesHandler.GetUnitCostLCYOnPostedSalesInvoiceSubform():
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

}
