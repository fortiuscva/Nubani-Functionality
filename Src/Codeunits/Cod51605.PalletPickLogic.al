codeunit 51605 "NDS Pallet Pick Logic"
{
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
        AvailableBinContent: Record "Bin Content";
        Item: Record Item;
        AvailablePalletQuantity: Decimal;
        EligiblePalletBinsFilter: Text;
        QuantityPerPallet: Decimal;
    begin
        if WarehouseActivityHeader.Type <> WarehouseActivityHeader.Type::"Invt. Pick" then
            exit;

        if not Item.Get(WarehouseActivityLine."Item No.") then
            exit;

        QuantityPerPallet := Item."Qty.  Per Pallet";

        if QuantityPerPallet <= 0 then
            exit;

        AvailableBinContent.Copy(FromBinContent);

        if AvailableBinContent.FindSet() then
            repeat
                AvailablePalletQuantity := AvailableBinContent.CalcQtyAvailToPick(0);

                if AvailablePalletQuantity >= QuantityPerPallet then begin
                    if EligiblePalletBinsFilter = '' then
                        EligiblePalletBinsFilter := AvailableBinContent."Bin Code"
                    else
                        EligiblePalletBinsFilter += '|' + AvailableBinContent."Bin Code";
                end;
            until AvailableBinContent.Next() = 0;

        if EligiblePalletBinsFilter <> '' then
            FromBinContent.SetFilter("Bin Code", EligiblePalletBinsFilter);
    end;


    [EventSubscriber(ObjectType::Codeunit,
    Codeunit::"Create Inventory Pick/Movement",
    'OnInsertPickOrMoveBinWhseActLineOnBeforeLoopIteration',
    '', false, false)]
    local procedure OnInsertPickOrMoveBinWhseActLineOnBeforeLoopIteration(
        var FromBinContent: Record "Bin Content";
        NewWarehouseActivityLine: Record "Warehouse Activity Line";
        BinCode: Code[20];
        DefaultBin: Boolean;
        var RemQtyToPickBase: Decimal;
        var IsHandled: Boolean;
        var QtyAvailToPickBase: Decimal)
    var
        Item: Record Item;
        QuantityPerPallet: Decimal;
        FullPalletQuantityBase: Decimal;
    begin
        if not Item.Get(FromBinContent."Item No.") then
            exit;

        QuantityPerPallet := Item."Qty.  Per Pallet";

        if QuantityPerPallet <= 0 then
            exit;

        if RemQtyToPickBase < QuantityPerPallet then
            exit;

        QtyAvailToPickBase := FromBinContent.CalcQtyAvailToPick(0);

        FullPalletQuantityBase :=
            Round(
                QtyAvailToPickBase / QuantityPerPallet,
                1,
                '<')
            * QuantityPerPallet;

        if FullPalletQuantityBase <= 0 then
            exit;

        if FullPalletQuantityBase > RemQtyToPickBase then
            FullPalletQuantityBase :=
                Round(
                    RemQtyToPickBase / QuantityPerPallet,
                    1,
                    '<')
                * QuantityPerPallet;

        if FullPalletQuantityBase <= 0 then
            exit;

        QtyAvailToPickBase := FullPalletQuantityBase;
    end;
}