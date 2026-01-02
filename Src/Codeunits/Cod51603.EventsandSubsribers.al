codeunit 51603 "NDS Events and Subsribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Inventory Pick/Movement", OnBeforeSetLineData, '', false, false)]
    local procedure "Create Inventory Pick/Movement_OnBeforeSetLineData"(var WarehouseActivityLine: Record "Warehouse Activity Line"; WarehouseActivityHeader: Record "Warehouse Activity Header"; TakeBinCode: Code[20]; var NextLineNo: Integer; Location: Record Location; var LineCreated: Boolean; var IsHandled: Boolean)
    begin
        if WarehouseActivityLine."Lot No." = '' then
            IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnCheckWarehouseOnBeforeShowDialog, '', false, false)]
    local procedure "Sales Line_OnCheckWarehouseOnBeforeShowDialog"(var SalesLine: Record "Sales Line"; Location: Record Location; var ShowDialog: Option; var DialogText: Text[50])
    begin
        //ShowDialog := 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnCheckWarehouseOnBeforeShowDialog, '', false, false)]
    local procedure "Purchase Line_OnCheckWarehouseOnBeforeShowDialog"(var PurchLine: Record "Purchase Line"; Location2: Record Location; var ShowDialog: Option; var DialogText: Text[50])
    begin
        ShowDialog := 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeSalesShptHeaderInsert, '', false, false)]
    local procedure "Sales-Post_OnBeforeSalesShptHeaderInsert"(var SalesShptHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; var TempWhseRcptHeader: Record "Warehouse Receipt Header" temporary; WhseReceive: Boolean; var TempWhseShptHeader: Record "Warehouse Shipment Header" temporary; WhseShip: Boolean; InvtPickPutaway: Boolean)
    begin
        SalesShptHeader."NDS Driver ID" := SalesHeader."NDS Driver ID";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeSalesInvHeaderInsert, '', false, false)]
    local procedure "Sales-Post_OnBeforeSalesInvHeaderInsert"(var SalesInvHeader: Record "Sales Invoice Header"; var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; var IsHandled: Boolean; WhseShip: Boolean; WhseShptHeader: Record "Warehouse Shipment Header"; InvtPickPutaway: Boolean)
    begin
        SalesInvHeader."NDS Driver ID" := SalesHeader."NDS Driver ID";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ArchiveManagement, OnBeforeSalesHeaderArchiveInsert, '', false, false)]
    local procedure ArchiveManagement_OnBeforeSalesHeaderArchiveInsert(var SalesHeaderArchive: Record "Sales Header Archive"; SalesHeader: Record "Sales Header")
    begin
        SalesHeaderArchive."NDS Driver ID" := SalesHeader."NDS Driver ID";
    end;


}
