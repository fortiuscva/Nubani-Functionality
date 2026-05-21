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
        BinContent: Record "Bin Content";
        SalesLine: Record "Sales Line";
        Item: Record Item;
        QtyPerPallet: Decimal;
        RemainingPalletQty: Decimal;
        RemainingCaseQty: Decimal;
        AvailableQty: Decimal;
        SelectedBins: Text;
    begin
        if WarehouseActivityHeader.Type <> WarehouseActivityHeader.Type::"Invt. Pick" then
            exit;

        if not Item.Get(WarehouseActivityLine."Item No.") then
            exit;

        QtyPerPallet := Item."Qty.  Per Pallet";

        if QtyPerPallet <= 0 then
            exit;

        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Document No.", WarehouseRequest."Source No.");
        SalesLine.SetRange("No.", WarehouseActivityLine."Item No.");

        if not SalesLine.FindFirst() then
            exit;

        RemainingPalletQty :=
            Round(SalesLine.Quantity / QtyPerPallet, 1, '<') * QtyPerPallet;

        RemainingCaseQty :=
            SalesLine.Quantity - RemainingPalletQty;

        BinContent.Copy(FromBinContent);

        if BinContent.FindSet() then
            repeat
                AvailableQty := BinContent.CalcQtyAvailToPick(0);

                if (AvailableQty >= QtyPerPallet) and (RemainingPalletQty > 0) then begin

                    if SelectedBins = '' then
                        SelectedBins := BinContent."Bin Code"
                    else
                        SelectedBins += '|' + BinContent."Bin Code";

                    RemainingPalletQty -=
                        Round(AvailableQty / QtyPerPallet, 1, '<') * QtyPerPallet;
                end;
            until (BinContent.Next() = 0) or (RemainingPalletQty <= 0);

        if RemainingCaseQty > 0 then begin
            BinContent.Reset();
            BinContent.Copy(FromBinContent);

            if BinContent.FindSet() then
                repeat
                    AvailableQty := BinContent.CalcQtyAvailToPick(0);

                    if (AvailableQty > 0) and
                       (StrPos(SelectedBins, BinContent."Bin Code") = 0)
                    then begin

                        if SelectedBins = '' then
                            SelectedBins := BinContent."Bin Code"
                        else
                            SelectedBins += '|' + BinContent."Bin Code";

                        break;
                    end;
                until BinContent.Next() = 0;
        end;

        if SelectedBins <> '' then begin
            FromBinContent.SetFilter("Bin Code", SelectedBins);
            FromBinContent.SetCurrentKey("Quantity (Base)");
            FromBinContent.Ascending(false);
        end;
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
        QtyPerPallet: Decimal;
    begin
        if not Item.Get(FromBinContent."Item No.") then
            exit;

        QtyPerPallet := Item."Qty.  Per Pallet";

        if (QtyPerPallet <= 0) or
           (RemQtyToPickBase < QtyPerPallet)
        then
            exit;

        QtyAvailToPickBase :=
            Round(
                FromBinContent.CalcQtyAvailToPick(0) / QtyPerPallet,
                1,
                '<')
            * QtyPerPallet;

        if QtyAvailToPickBase > RemQtyToPickBase then
            QtyAvailToPickBase :=
                Round(
                    RemQtyToPickBase / QtyPerPallet,
                    1,
                    '<')
                * QtyPerPallet;
    end;
}