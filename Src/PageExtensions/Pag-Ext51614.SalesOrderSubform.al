pageextension 51614 "NDS Sales Order Subform" extends "Sales Order Subform"
{
    layout
    {
        modify("Qty. to Ship")
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

    var
        NDSSingleInstance: Codeunit "NDS Single Instance";
}
