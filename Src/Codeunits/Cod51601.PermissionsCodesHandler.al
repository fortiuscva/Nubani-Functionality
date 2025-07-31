codeunit 51601 "NDS Permissions Codes Handler"
{
    //31 "Item List" Start
    procedure GetUnitCostOnItemList(): Code[100]
    begin
        exit(UnitCostOnItemListLbl);
    end;

    procedure GetBlockedonItemList(): Code[100]
    begin
        exit(BlockedOnItemListLbl);
    end;
    //31 End

    //30 "Item Card" Start
    procedure GetUnitCostOnItemCard(): Code[100]
    begin
        exit(UnitCostOnItemCardLbl);
    end;

    procedure GetBlockedonItemCard(): Code[100]
    begin
        exit(BlockedOnItemCardLbl);
    end;
    //30 End

    //95 "Sales Quote Subform" Start
    procedure GetUnitCostLCYOnSalesQuoteSubform(): Code[100]
    begin
        exit(UnitCostLCYOnSalesQuoteSubformLbl);
    end;

    //95 End

    //133 "Posted Sales Invoice Subform"
    procedure GetUnitCostLCYOnPostedSalesInvoiceSubform(): Code[100]
    begin
        exit(UnitCostLCYOnPostedSalesInvoiceSubformLbl);
    end;

    //526 Posted Sales Invoice Lines Start
    procedure GetUnitCostLCYOnPostedSalesInvoiceLines(): Code[100]
    begin
        exit(UnitCostLCYOnPostedSalesInvoiceLinesLbl);
    end;

    //526 End

    //54 Purchase Order Subform Start
    procedure GetUnitCostLCYOnPurchaseOrderSubform(): Code[100]
    begin
        exit(UnitCostLCYOnPurchaseOrderSubformLbl);
    end;

    procedure GetDirectUnitCostOnPurchaseOrderSubform(): Code[100]
    begin
        exit(DirectUnitCostOnPurchaseOrderSubformLbl);
    end;
    //54 End

    //518 Purchase Lines Start
    procedure GetUnitCostLCYOnPurchaseLines(): Code[100]
    begin
        exit(UnitCostLCYOnPurchaseLinesLbl);
    end;

    procedure GetDirectUnitCostOnPurchaseLines(): Code[100]
    begin
        exit(DirectUnitCostOnPurchaseLinesLbl);
    end;
    //518 End



    //139 Posted Purchhase Invoice Subform Start
    procedure GetUnitCostLCYOnPostedPurchInvoieSubform(): Code[100]
    begin
        exit(UnitCostLCYOnPurchaseLinesLbl);
    end;

    procedure GetDirectUnitCostPostedPurchInvoieSubform(): Code[100]
    begin
        exit(DirectUnitCostOnPostedPurchInvoieSubformLbl);
    end;
    //139 End


    //529 Start
    procedure GetUnitCostLCYOnPostedPurchaseInvoiceLines(): Code[100]
    begin
        exit(UnitCostLCYOnPostedPurchaseInvoiceLinesLbl);
    end;

    procedure GetDirectUnitCostOnPostedPurchaseInvoiceLines(): Code[100]
    begin
        exit(DirectUnitCostOnPostedPurchaseInvoiceLinesLbl);
    end;
    //529 end;
    //38 Start
    procedure GetCostAmountExpectedOnItemLedgerEntries(): Code[100]
    begin
        exit(CostAmountExpectedOnItemLedgerEntriesLbl);
    end;

    procedure GetCostAmountActualOnItemLedgerEntries(): Code[100]
    begin
        exit(CostAmountActualOnItemLedgerEntriesLbl);
    end;
    //38 end;
    //5802 Start
    procedure GetCostAmountExpectedOnValueEntries(): Code[100]
    begin
        exit(CostAmountExpectedOnValueEntriesLbl);
    end;

    procedure GetCostAmountActualOnValueEntries(): Code[100]
    begin
        exit(CostAmountActualOnValueEntriesLbl);
    end;

    procedure GetCostPerUnitOnValueEntries(): Code[100]
    begin
        exit(CostPerUnitOnValueEntriesLbl);
    end;

    procedure GetCostPostedToGLOnValueEntries(): Code[100]
    begin
        exit(CostPostedToGLOnValueEntriesLbl);
    end;
    //5802 end
    procedure IntallPermissionCodes();
    var
        PermissionCodes: Record "NDS Permission Code";
    begin
        //31 "Item List" 
        if not PermissionCodes.GET(UnitCostOnItemListLbl) then
            CreatePermissionCode(UnitCostOnItemListLbl, Page::"Item List");
        if not PermissionCodes.GET(BlockedOnItemListLbl) then
            CreatePermissionCode(BlockedOnItemListLbl, Page::"Item List");

        //30 "Item Card" 
        if not PermissionCodes.GET(UnitCostOnItemCardLbl) then
            CreatePermissionCode(UnitCostOnItemCardLbl, Page::"Item Card");
        if not PermissionCodes.GET(BlockedOnItemCardLbl) then
            CreatePermissionCode(BlockedOnItemCardLbl, Page::"Item Card");

        //95 "Sales Quote Subform"
        if not PermissionCodes.GET(UnitCostLCYOnSalesQuoteSubformLbl) then
            CreatePermissionCode(UnitCostLCYOnSalesQuoteSubformLbl, Page::"Sales Quote Subform");

        //133 "Posted Sales Invoice Subform"
        if not PermissionCodes.GET(UnitCostLCYOnPostedSalesInvoiceSubformLbl) then
            CreatePermissionCode(UnitCostLCYOnPostedSalesInvoiceSubformLbl, Page::"Posted Sales Invoice Subform");

        //526 "Posted Sales Invoice Lines"
        if not PermissionCodes.GET(UnitCostLCYOnPostedSalesInvoiceLinesLbl) then
            CreatePermissionCode(UnitCostLCYOnPostedSalesInvoiceLinesLbl, Page::"Posted Sales Invoice Lines");

        //54 "Purchase Order Subform"
        if not PermissionCodes.GET(UnitCostLCYOnPurchaseOrderSubformLbl) then
            CreatePermissionCode(UnitCostLCYOnPurchaseOrderSubformLbl, Page::"Purchase Order Subform");

        if not PermissionCodes.GET(DirectUnitCostOnPurchaseOrderSubformLbl) then
            CreatePermissionCode(DirectUnitCostOnPurchaseOrderSubformLbl, Page::"Purchase Order Subform");

        //518 "Purchase Lines"
        if not PermissionCodes.GET(UnitCostLCYOnPurchaseLinesLbl) then
            CreatePermissionCode(UnitCostLCYOnPurchaseLinesLbl, Page::"Purchase Lines");

        if not PermissionCodes.GET(DirectUnitCostOnPurchaseLinesLbl) then
            CreatePermissionCode(DirectUnitCostOnPurchaseLinesLbl, Page::"Purchase Lines");

        //139 "Posted Purch. Invoice Subform"
        if not PermissionCodes.GET(UnitCostLCYOnPostedPurchInvoieSubformLbl) then
            CreatePermissionCode(UnitCostLCYOnPostedPurchInvoieSubformLbl, Page::"Posted Purch. Invoice Subform");

        if not PermissionCodes.GET(DirectUnitCostOnPostedPurchInvoieSubformLbl) then
            CreatePermissionCode(DirectUnitCostOnPostedPurchInvoieSubformLbl, Page::"Posted Purch. Invoice Subform");

        //529 "Posted Purchase Invoice Lines"
        if not PermissionCodes.GET(UnitCostLCYOnPostedPurchaseInvoiceLinesLbl) then
            CreatePermissionCode(UnitCostLCYOnPostedPurchaseInvoiceLinesLbl, Page::"Posted Purchase Invoice Lines");

        if not PermissionCodes.GET(DirectUnitCostOnPostedPurchaseInvoiceLinesLbl) then
            CreatePermissionCode(DirectUnitCostOnPostedPurchaseInvoiceLinesLbl, Page::"Posted Purchase Invoice Lines");

        //38 "Item Ledger Entries"
        if not PermissionCodes.GET(CostAmountExpectedOnItemLedgerEntriesLbl) then
            CreatePermissionCode(CostAmountExpectedOnItemLedgerEntriesLbl, Page::"Item Ledger Entries");

        if not PermissionCodes.GET(CostAmountActualOnItemLedgerEntriesLbl) then
            CreatePermissionCode(CostAmountActualOnItemLedgerEntriesLbl, Page::"Item Ledger Entries");

        //5802 "Value Entries"
        if not PermissionCodes.GET(CostAmountExpectedOnValueEntriesLbl) then
            CreatePermissionCode(CostAmountExpectedOnValueEntriesLbl, Page::"Value Entries");

        if not PermissionCodes.GET(CostAmountActualOnValueEntriesLbl) then
            CreatePermissionCode(CostAmountActualOnValueEntriesLbl, Page::"Value Entries");

        if not PermissionCodes.GET(CostPerUnitOnValueEntriesLbl) then
            CreatePermissionCode(CostPerUnitOnValueEntriesLbl, Page::"Value Entries");

        if not PermissionCodes.GET(CostPostedToGLOnValueEntriesLbl) then
            CreatePermissionCode(CostPostedToGLOnValueEntriesLbl, Page::"Value Entries");
    end;

    procedure CreatePermissionCode(PermissionCodePar: Code[100]; PageIDPar: Integer);
    var
        PermissionCodes: Record "NDS Permission Code";
    begin
        PermissionCodes.Init();
        PermissionCodes.Code := PermissionCodePar;
        PermissionCodes."Page ID" := PageIDPar;
        PermissionCodes.Insert(true);
    end;

    var
        //31 "Item List" 
        UnitCostOnItemListLbl: Label 'UNIT COST ON ITEM LIST';
        BlockedOnItemListLbl: Label 'BLOCKED ON ITEM LIST';

        //30 "Item Card" 
        UnitCostOnItemCardLbl: Label 'UNIT COST ON ITEM CARD';
        BlockedOnItemCardLbl: Label 'BLOCKED ON ITEM CARD';

        //95 "Sales Quote Subform"
        UnitCostLCYOnSalesQuoteSubformLbl: Label 'UNIT COST (LCY) ON POSTED SALES QUOTE SUBFORM';

        //133 "Posted Sales Invoice Subform"
        UnitCostLCYOnPostedSalesInvoiceSubformLbl: Label 'UNIT COST (LCY) ON POSTED SALES INVOICE SUBFORM';

        //526 "Posted Sales Invoice Lines"
        UnitCostLCYOnPostedSalesInvoiceLinesLbl: Label 'UNIT COST (LCY) ON POSTED SALES INVOICE LINES';

        //54
        UnitCostLCYOnPurchaseOrderSubformLbl: Label 'UNIT COST (LCY) ON PURCHASE ORDER SUBFORM';
        DirectUnitCostOnPurchaseOrderSubformLbl: Label 'DIRECT UNIT COST ON PURCHASE ORDER SUBFORM';

        //518
        UnitCostLCYOnPurchaseLinesLbl: Label 'UNIT COST (LCY) ON PURCHASE LINES';
        DirectUnitCostOnPurchaseLinesLbl: Label 'DIRECT UNIT COST ON PURCHASE LINES';

        //139
        UnitCostLCYOnPostedPurchInvoieSubformLbl: Label 'UNIT COST (LCY) ON POSTED PURCH. INVOICE SUBFORM';
        DirectUnitCostOnPostedPurchInvoieSubformLbl: Label 'DIRECT UNIT COST ON POSTED PURCH. INVOICE SUBFORM';

        //529
        UnitCostLCYOnPostedPurchaseInvoiceLinesLbl: Label 'UNIT COST (LCY) ON POSTED PURCHASE INVOICE LINES';
        DirectUnitCostOnPostedPurchaseInvoiceLinesLbl: Label 'DIRECT UNIT COST ON POSTED PURCHASE INVOICE LINES';

        //38 
        CostAmountExpectedOnItemLedgerEntriesLbl: Label 'COST AMOUNT (EXPECTED) ON ITEM LEDGER ENTRIES';

        CostAmountActualOnItemLedgerEntriesLbl: Label 'COST AMOUNT (ACTUAL) ON ITEM LEDGER ENTRIES';

        //5802
        CostAmountExpectedOnValueEntriesLbl: Label 'COST AMOUNT (EXPECTED) ON VALUE ENTRIES';

        CostAmountActualOnValueEntriesLbl: Label 'COST AMOUNT (ACTUAL) ON VALUE ENTRIES';

        CostPerUnitOnValueEntriesLbl: Label 'COST PER UNIT ON VALUE ENTRIES';

        CostPostedToGLOnValueEntriesLbl: Label 'COST POSTED TO GL ON VALUE ENTRIES';
}
