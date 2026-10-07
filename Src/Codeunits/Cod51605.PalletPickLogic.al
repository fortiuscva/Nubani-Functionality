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
        RemainingPalletQtyInCases: Decimal;
        RemainingCaseQty: Decimal;
        AvailableQty: Decimal;
        SelectedBins: Text;
        SelectedBinsForRemainingQty: Text;
        RemainingQtyInBinAfterConsumingPalletQty: Decimal;
        TotalNetRemainingQtytoPick: Decimal;
        AvailableQtyInCases: Decimal;
        PalletBinOrder: Integer;
        InventorySetup: Record "Inventory Setup";
    begin

        if not InventorySetup.get() then
            exit;

        if not InventorySetup."NDS Activate Pallet Picking" then
            exit;

        if WarehouseActivityHeader.Type <> WarehouseActivityHeader.Type::"Invt. Pick" then
            exit;

        if not Item.Get(WarehouseActivityLine."Item No.") then
            exit;

        QtyPerPallet := Item."Qty.  Per Pallet";

        if QtyPerPallet <= 0 then
            exit;

        PalletBinOrder := 1;
        SelectedBinsForRemainingQty := '';
        SelectedBins := '';

        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Document No.", WarehouseRequest."Source No.");
        SalesLine.SetRange("No.", WarehouseActivityLine."Item No.");
        if not SalesLine.FindFirst() then
            exit;

        BinContent.Copy(FromBinContent);
        BinContent.SetRange("Bin Code");
        BinContent.ModifyAll("NDS Pallet Bin Order", 9999);
        RemainingPalletQtyInCases :=
            Round(SalesLine."Qty. to Ship (Base)" / QtyPerPallet, 1, '<') * QtyPerPallet;

        RemainingCaseQty :=
            SalesLine."Qty. to Ship (Base)" - RemainingPalletQtyInCases; //Remaining Case Qty is the loose quantity which is needed ater palleted qty.

        BinContent.Copy(FromBinContent);
        BinContent.SetRange("Bin Code");

        if BinContent.FindSet() then
            repeat
                AvailableQty := BinContent.CalcQtyAvailToPick(0);

                if (AvailableQty >= QtyPerPallet) and
                   (RemainingPalletQtyInCases > 0)
                then begin

                    if SelectedBins = '' then
                        SelectedBins := BinContent."Bin Code"
                    else
                        SelectedBins += '|' + BinContent."Bin Code";

                    AvailableQtyInCases := (Round(AvailableQty / QtyPerPallet, 1, '<') * QtyPerPallet);
                    if RemainingPalletQtyInCases > AvailableQtyInCases then
                        RemainingPalletQtyInCases -= AvailableQtyInCases
                    else
                        RemainingPalletQtyInCases := 0;

                    RemainingQtyInBinAfterConsumingPalletQty := (AvailableQty mod QtyPerPallet);
                    if (RemainingQtyInBinAfterConsumingPalletQty <> 0) and (RemainingCaseQty > 0) then begin
                        if RemainingCaseQty > RemainingQtyInBinAfterConsumingPalletQty then
                            RemainingCaseQty -= RemainingQtyInBinAfterConsumingPalletQty
                        else
                            RemainingCaseQty := 0;
                    end;
                end;
            until (BinContent.Next() = 0) or (RemainingPalletQtyInCases <= 0);

        If SelectedBins <> '' then begin
            FromBinContent.SetFilter("Bin Code", SelectedBins);
            //FromBinContent.SetCurrentKey("Quantity (Base)", "Bin Ranking");
            FromBinContent.SetCurrentKey("Bin Ranking");
            FromBinContent.Ascending(false);
            if FromBinContent.FindSet() then
                repeat
                    FromBinContent."NDS Pallet Bin Order" := PalletBinOrder;
                    FromBinContent.Modify();
                    PalletBinOrder += 1;
                until FromBinContent.Next() = 0;
            FromBinContent.SetRange("Bin Code");
            if not FromBinContent.Find('-') then;
        end else
            FromBinContent.SetFilter("Bin Code", '%1', '');


        TotalNetRemainingQtytoPick := RemainingPalletQtyInCases + RemainingCaseQty; //Calculate Net Pending After consuming qty from available pallets.
        If TotalNetRemainingQtytoPick > 0 then begin
            BinContent.Copy(FromBinContent);
            BinContent.SetRange("Bin Code");
            BinContent.SetCurrentKey("Bin Ranking");
            BinContent.Ascending(false);
            if BinContent.FindSet() then
                repeat
                    AvailableQty := BinContent.CalcQtyAvailToPick(0);

                    if (AvailableQty > 0) and
                       (StrPos(SelectedBins, BinContent."Bin Code") = 0)
                    then begin
                        if SelectedBinsForRemainingQty = '' then
                            SelectedBinsForRemainingQty := BinContent."Bin Code"
                        else
                            SelectedBinsForRemainingQty += '|' + BinContent."Bin Code";

                        TotalNetRemainingQtytoPick -= AvailableQty;
                    end;
                until (BinContent.Next() = 0) or (TotalNetRemainingQtytoPick <= 0);
        end;

        if SelectedBinsForRemainingQty <> '' then begin
            FromBinContent.SetFilter("Bin Code", SelectedBinsForRemainingQty);
            //FromBinContent.SetCurrentKey("Quantity (Base)", "Bin Ranking");
            FromBinContent.SetCurrentKey("Bin Ranking");
            FromBinContent.Ascending(false);
            if FromBinContent.FindSet() then
                repeat
                    FromBinContent."NDS Pallet Bin Order" := PalletBinOrder;
                    FromBinContent.Modify();
                    PalletBinOrder += 1;
                until FromBinContent.Next() = 0;
            FromBinContent.SetRange("Bin Code");
            if not FromBinContent.Find('-') then;
        end else begin
            FromBinContent.SetRange("Bin Code");
            if not FromBinContent.Find('-') then;
        end;
        if (SelectedBins <> '') or (SelectedBinsForRemainingQty <> '') then begin
            FromBinContent.SetCurrentKey("NDS Pallet Bin Order");
            FromBinContent.Ascending(true);
        end;
    end;
    // [EventSubscriber(ObjectType::Codeunit,
    // Codeunit::"Create Inventory Pick/Movement",
    // 'OnInsertPickOrMoveBinWhseActLineOnBeforeLoopIteration',
    // '', false, false)]
    // local procedure OnInsertPickOrMoveBinWhseActLineOnBeforeLoopIteration(
    //     var FromBinContent: Record "Bin Content";
    //     NewWarehouseActivityLine: Record "Warehouse Activity Line";
    //     BinCode: Code[20];
    //     DefaultBin: Boolean;
    //     var RemQtyToPickBase: Decimal;
    //     var IsHandled: Boolean;
    //     var QtyAvailToPickBase: Decimal)
    // var
    //     Item: Record Item;
    //     QtyPerPallet: Decimal;
    // begin
    //     if not Item.Get(FromBinContent."Item No.") then
    //         exit;

    //     QtyPerPallet := Item."Qty.  Per Pallet";

    //     if (QtyPerPallet <= 0) or
    //        (RemQtyToPickBase < QtyPerPallet)
    //     then
    //         exit;

    //     QtyAvailToPickBase :=
    //         Round(
    //             FromBinContent.CalcQtyAvailToPick(0) / QtyPerPallet,
    //             1,
    //             '<')
    //         * QtyPerPallet;

    //     if QtyAvailToPickBase > RemQtyToPickBase then
    //         QtyAvailToPickBase :=
    //             Round(
    //                 RemQtyToPickBase / QtyPerPallet,
    //                 1,
    //                 '<')
    //             * QtyPerPallet;
    // end;
}