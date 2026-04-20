report 51602 "NDS Auto Lot Assignment"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(PurchLine; "Purchase Line")
        {
            DataItemTableView = sorting("Document Type", "Document No.", "Line No.") where("Document Type" = const(Order), Type = const(Item), "Outstanding Quantity" = filter(<> 0));

            trigger OnPreDataItem()
            begin
                SetRange("Document No.", FilterDocNo);
            end;

            trigger OnAfterGetRecord()
            var
                CreateReservEntry: Codeunit "Create Reserv. Entry";
                ForReservEntry, ReservEntry : Record "Reservation Entry";
                TrackingSpec: Record "Tracking Specification";
                ItemTrackingVal: integer;
            begin
                Clear(ForReservEntry);
                Clear(TrackingSpec);
                ItemTrackingVal := FindItemTrackingCode(PurchLine."No.");
                if (ItemTrackingVal <> 0) then begin

                    ReservEntry.Reset();
                    ReservEntry.SetRange("Source Type", Database::"Purchase Line");
                    ReservEntry.SetRange("Source ID", PurchLine."Document No.");
                    ReservEntry.SetRange("Source Ref. No.", PurchLine."Line No.");
                    ReservEntry.SetRange("Source Subtype", 1);
                    if ReservEntry.FindSet() then
                        ReservEntry.DeleteAll();

                    ForReservEntry."Lot No." := LotNo;
                    TrackingSpec."New Lot No." := LotNo;

                    CreateReservEntry.CreateReservEntryFor(
                    Database::"Purchase Line", 1,
                    PurchLine."Document No.", '',
                    0, PurchLine."Line No.",
                    PurchLine."Qty. per Unit of Measure", PurchLine.Quantity, PurchLine."Quantity (Base)",
                    ForReservEntry);

                    CreateReservEntry.SetNewTrackingFromNewTrackingSpecification(TrackingSpec);

                    Evaluate(ExpirationDate, ExpirationText);
                    CreateReservEntry.SetDates(0D, ExpirationDate);

                    CreateReservEntry.CreateEntry(
                    PurchLine."No.", PurchLine."Variant Code",
                    PurchLine."Location Code", PurchLine.Description,
                    0D, PurchLine."Expected Receipt Date",
                    0, ForReservEntry."Reservation Status"::Surplus);
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                field(FilterDocNo; FilterDocNo)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Document No.';
                }
                field(LotNo; LotNo)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if strlen(LotNo) <> 8 then
                            Error('Lot No. should be 8 numeric characters');
                        ExpirationText := COPYSTR(LotNo, 5, 2) + COPYSTR(LotNo, 7, 2) + COPYSTR(LotNo, 1, 4);
                    end;
                }

            }
        }
    }

    var
        LotNo: Code[50];
        FilterDocNo: Code[20];
        ExpirationText: Text;
        ExpirationDate: Date;

    procedure SetDocumentNo(DocNo: Code[20])
    begin
        FilterDocNo := DocNo
    end;

    procedure FindItemTrackingCode(ItemNoPar: Code[20]) TrackingType: Integer
    var
        ItemTrackingCodeRecLcl: Record "Item Tracking Code";
        ItemRecLcl: Record Item;
    begin
        ItemRecLcl.GET(ItemNoPar);
        IF ItemRecLcl."Item Tracking Code" = '' THEN
            EXIT(0); //No Tracking

        ItemTrackingCodeRecLcl.GET(ItemRecLcl."Item Tracking Code");
        IF ItemTrackingCodeRecLcl."SN Specific Tracking" THEN
            IF ItemTrackingCodeRecLcl."Lot Specific Tracking" THEN
                EXIT(3) //Lot Serial Combo
            ELSE
                EXIT(2) //Serial Specific
        ELSE
            IF ItemTrackingCodeRecLcl."Lot Specific Tracking" THEN
                EXIT(1); //Lot Specific
        EXIT(0);
    end;
}