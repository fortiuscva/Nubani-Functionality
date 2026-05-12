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

    [EventSubscriber(ObjectType::Codeunit,
       Codeunit::"Create Inventory Pick/Movement",
       'OnBeforeFindFromBinContent',
       '', false, false)]
    local procedure OnBeforeFindFromBinContent(
           var FromBinContent: Record "Bin Content";
           var WarehouseActivityLine: Record "Warehouse Activity Line";
           FromBinCode: Code[20];
           BinCode: Code[20];
           IsInvtMovement: Boolean;
           IsBlankInvtMovement: Boolean;
           DefaultBin: Boolean;
           WhseItemTrackingSetup: Record "Item Tracking Setup";
           var WarehouseActivityHeader: Record "Warehouse Activity Header";
           var WarehouseRequest: Record "Warehouse Request")
    var
        BinContent: Record "Bin Content";
        Item: Record Item;
        QtyAvail: Decimal;
        BinFilter: Text;
        RequiredQty: Decimal;
    begin
        PalletLogicActive := false;
        RemainingPalletQty := 0;
        QtyPerPalletGlobal := 0;

        if WarehouseActivityHeader.Type <> WarehouseActivityHeader.Type::"Invt. Pick" then
            exit;

        if not Item.Get(WarehouseActivityLine."Item No.") then
            exit;

        QtyPerPalletGlobal := Item."Qty.  Per Pallet";

        if QtyPerPalletGlobal <= 0 then
            exit;

        RequiredQty := WarehouseActivityLine."Qty. (Base)";

        if RequiredQty < QtyPerPalletGlobal then
            exit;

        RemainingPalletQty :=
            Round(RequiredQty / QtyPerPalletGlobal, 1, '<') * QtyPerPalletGlobal;

        if RemainingPalletQty <= 0 then
            exit;

        PalletLogicActive := true;

        BinContent.Copy(FromBinContent);

        if BinContent.FindSet() then
            repeat
                QtyAvail := BinContent.CalcQtyAvailToPick(0);

                if QtyAvail >= QtyPerPalletGlobal then begin
                    if BinFilter = '' then
                        BinFilter := BinContent."Bin Code"
                    else
                        BinFilter += '|' + BinContent."Bin Code";
                end;
            until BinContent.Next() = 0;

        if BinFilter <> '' then
            FromBinContent.SetFilter("Bin Code", BinFilter);
    end;


    [EventSubscriber(ObjectType::Codeunit,
    Codeunit::"Create Inventory Pick/Movement",
    'OnInsertPickOrMoveBinWhseActLineOnAfterCalcQtyAvailToPick',
    '', false, false)]
    local procedure OnInsertPickOrMoveBinWhseActLineOnAfterCalcQtyAvailToPick(
        var QtyAvailToPickBase: Decimal;
        FromBinContent: Record "Bin Content")
    var
        FullPalletQty: Decimal;
    begin
        if not PalletLogicActive then
            exit;

        if RemainingPalletQty <= 0 then begin
            PalletLogicActive := false;
            exit;
        end;

        if QtyPerPalletGlobal <= 0 then begin
            PalletLogicActive := false;
            exit;
        end;

        if QtyAvailToPickBase < QtyPerPalletGlobal then begin
            PalletLogicActive := false;
            exit;
        end;

        FullPalletQty :=
            Round(QtyAvailToPickBase / QtyPerPalletGlobal, 1, '<') * QtyPerPalletGlobal;

        if FullPalletQty <= 0 then begin
            PalletLogicActive := false;
            exit;
        end;

        if FullPalletQty > RemainingPalletQty then
            FullPalletQty :=
                Round(RemainingPalletQty / QtyPerPalletGlobal, 1, '<') * QtyPerPalletGlobal;

        if FullPalletQty <= 0 then begin
            PalletLogicActive := false;
            exit;
        end;

        QtyAvailToPickBase := FullPalletQty;

        RemainingPalletQty -= FullPalletQty;

        if RemainingPalletQty <= 0 then
            PalletLogicActive := false;
    end;

    var
        RemainingPalletQty: Decimal;
        QtyPerPalletGlobal: Decimal;
        PalletLogicActive: Boolean;
}
