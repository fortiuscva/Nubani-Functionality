codeunit 51603 "NDS Events and Subsribers"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Inventory Pick/Movement", OnBeforeSetLineData, '', false, false)]
    local procedure "Create Inventory Pick/Movement_OnBeforeSetLineData"(var WarehouseActivityLine: Record "Warehouse Activity Line"; WarehouseActivityHeader: Record "Warehouse Activity Header"; TakeBinCode: Code[20]; var NextLineNo: Integer; Location: Record Location; var LineCreated: Boolean; var IsHandled: Boolean)
    begin
        if WarehouseActivityLine."Lot No." = '' then
            IsHandled := true;
    end;

}
