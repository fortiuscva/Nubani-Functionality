pageextension 51612 "NDS Value Entries" extends "Value Entries"
{
    layout
    {
        modify("Cost Amount (Expected)")
        {
            Visible = IsCostAmountExpectedVisible;
            Editable = IsCostAmountExpectedEditable;
        }
        modify("Cost Amount (Actual)")
        {
            Visible = IsCostAmountActualVisible;
            Editable = IsCostAmountActualEditable;
        }
        modify("Cost per Unit")
        {
            Visible = IsCostPerUnitVisibile;
            Editable = IsCostPerUnitEditable;
        }
        modify("Cost Posted to G/L")
        {
            Visible = IsCostPostedToGLVisible;
            Editable = IsCostPostedToGLEditable;
        }

    }
    trigger OnOpenPage()
    var
        PermissionCode: Record "NDS Permission Code";
    begin
        PermissionCode.Reset();
        PermissionCode.SetRange("Page Id", page::"Value Entries");
        if PermissionCode.FindSet() then
            repeat
                case PermissionCode.Code of
                    PermissionCodesHandler.GetCostAmountExpectedOnValueEntries():
                        begin
                            UserPermissionHandler.ApplyUserPermissions(UserId, PermissionCode.Code, IsCostAmountExpectedVisible, IsCostAmountExpectedEditable);
                        end;
                    PermissionCodesHandler.GetCostAmountActualOnValueEntries():
                        begin
                            UserPermissionHandler.ApplyUserPermissions(UserId, PermissionCode.Code, IsCostAmountActualVisible, IsCostAmountActualEditable);
                        end;

                    PermissionCodesHandler.GetCostPerUnitOnValueEntries():
                        begin
                            UserPermissionHandler.ApplyUserPermissions(UserId, PermissionCode.Code, IsCostPerUnitVisibile, IsCostPerUnitEditable);
                        end;
                    PermissionCodesHandler.GetCostPostedToGLOnValueEntries():
                        begin
                            UserPermissionHandler.ApplyUserPermissions(UserId, PermissionCode.Code, IsCostPostedToGLVisible, IsCostPostedToGLEditable);
                        end;

                end;
            until PermissionCode.Next() = 0;
    end;

    var
        UserPermissionHandler: Codeunit "NDS User Permissions Handler";
        PermissionCodesHandler: Codeunit "NDS Permissions Codes Handler";
        IsCostAmountExpectedVisible: Boolean;
        IsCostAmountExpectedEditable: Boolean;
        IsCostAmountActualVisible: Boolean;
        IsCostAmountActualEditable: Boolean;
        IsCostPerUnitVisibile: Boolean;
        IsCostPerUnitEditable: Boolean;
        IsCostPostedToGLVisible: Boolean;
        IsCostPostedToGLEditable: Boolean;
}
