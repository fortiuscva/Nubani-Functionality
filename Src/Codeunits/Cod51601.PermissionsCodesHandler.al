codeunit 51601 "NDS Permissions Codes Handler"
{

    procedure GetUnitCostLCYOnPostedPurchaseInvoiceLines(): Code[100]
    begin
        exit(UnitCostLCYOnPostedPurchaseInvoiceLinesLbl);
    end;

    procedure GetDirectUnitCostOnPostedPurchaseInvoiceLines(): Code[100]
    begin
        exit(DirectUnitCostOnPostedPurchaseInvoiceLinesLbl);
    end;

    var
        UnitCostLCYOnPostedPurchaseInvoiceLinesLbl: Label 'UNIT COST (LCY) ON POSTED PURCHASE INVOICE LINES';
        DirectUnitCostOnPostedPurchaseInvoiceLinesLbl: Label 'DIRECT UNIT COST ON POSTED PURCHASE INVOICE LINES';
}
