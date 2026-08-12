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

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnQueryClosePageOnBeforeConfirmClosePage', '', false, false)]
    local procedure ItemTrackingLinesOnQueryClosePageOnBeforeConfirmClosePage(var TrackingSpecification: Record "Tracking Specification"; var IsHandled: Boolean; CurrentRunMode: Enum "Item Tracking Run Mode"; var Result: Boolean)
    var
        AvailabilityWarningsErr: Label 'You do not have enough inventory to meet the demand for this Sales Order line.\\ Please reduce the quantity assigned to the Lot No. or select another Lot No. before leaving Item Tracking Lines.';
    begin
        /* if TrackingSpecification."Source Subtype" <> Enum::"Sales Document Type"::Order.AsInteger()
        then
            exit;

        if TrackingSpecification."Source Type" <> Database::"Sales Line"
        then
            exit; */
        Error(AvailabilityWarningsErr);
    end;

}
