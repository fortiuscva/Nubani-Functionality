pageextension 51622 "NDS SalesOrderExt" extends "Sales Order"
{
    actions
    {
        addlast(Processing)
        {
            action("NDS Shipping Form")
            {
                ApplicationArea = All;
                Image = Document;

                trigger OnAction()
                var
                    ShippingHeader: Record "NDS Order Shipping Header";
                begin

                    ShippingHeader.SetRange("Source Document Type",
                        ShippingHeader."Source Document Type"::"Sales Order");
                    ShippingHeader.SetRange("Source Document No.", Rec."No.");
                    if not ShippingHeader.FindFirst() then begin
                        ShippingHeader.Init();
                        ShippingHeader."Source Document Type" :=
                            ShippingHeader."Source Document Type"::"Sales Order";
                        ShippingHeader."Source Document No." := Rec."No.";
                        ShippingHeader."Customer Name" := Rec."Sell-to Customer Name";
                        ShippingHeader."Salesperson" := Rec."Salesperson Code";
                        ShippingHeader."Order Date" := Rec."Order Date";
                        ShippingHeader."Shipping Method" := Rec."Shipment Method Code";
                        ShippingHeader.Insert(true);

                    end;

                    Page.Run(Page::"NDS Order Shipping Document", ShippingHeader);

                end;
            }
        }
    }
}