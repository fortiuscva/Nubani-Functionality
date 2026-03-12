table 51604 "NDS Order Shipping Header"
{
    Caption = 'Order Shipping';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            trigger OnValidate()
            var
                ShippingSetup: Record "NDS Shipping Setup";
                NoSeries: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    ShippingSetup.Get();
                    NoSeries.TestManual(ShippingSetup."Shipping Form Nos.");
                    "No. Series" := '';
                end;

            end;
        }

        field(2; "No. Series"; Code[20])
        {
            Editable = false;
        }

        field(10; "Source Document Type"; Enum "Shipping Source Document Type") { }

        field(11; "Source Document No."; Code[20])
        {
            TableRelation = "Sales Header"."No."
        WHERE("Document Type" = CONST(Order));

            trigger OnValidate()
            var
                SalesHeader: Record "Sales Header";
            begin
                if SalesHeader.Get(SalesHeader."Document Type"::Order, "Source Document No.") then begin
                    "Customer Name" := SalesHeader."Sell-to Customer Name";
                    "Salesperson" := SalesHeader."Salesperson Code";
                    "Order Date" := SalesHeader."Order Date";
                    "Shipping Method" := SalesHeader."Shipment Method Code";

                end;
            end;
        }

        field(20; "Customer Name"; Text[100]) { }

        field(21; Salesperson; Code[20])
        {
            TableRelation = "Salesperson/Purchaser";
        }

        field(22; "Order Date"; Date) { }

        field(23; "Shipping Method"; Code[20]) { }

        field(30; "Temp Control"; Enum "NDS Temp Control Option") { }

        field(40; "Alternate Shipping Address"; Boolean) { }

        field(41; "Lift Gate"; Boolean) { }

        field(42; "Notify Appointment"; Boolean) { }

        field(43; Other; Boolean) { }

        field(50; "Pre-Stack Pallet Count"; Integer) { }

        field(51; "Stacker Assigned"; Text[50]) { }

        field(52; "Post-Stack Pallet Count"; Integer) { }

        field(53; "Reviewed By"; Text[50]) { }

        field(60; Wrapper; Text[100]) { }

        field(61; Verifier; Text[50]) { }

        field(62; "Verifier Date"; Date) { }

        field(70; Notes; Text[250]) { }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        ShippingSetup: Record "NDS Shipping Setup";
        NoSeries: Codeunit "No. Series";
        SalesHeader: Record "Sales Header";
        SalesOrderNo: Code[20];
    begin
        if "No." = '' then begin

            ShippingSetup.Get();
            ShippingSetup.TestField("Shipping Form Nos.");

            "No. Series" := ShippingSetup."Shipping Form Nos.";

            "No." := NoSeries.GetNextNo(
                        ShippingSetup."Shipping Form Nos.",
                        WorkDate());

            SalesOrderNo := Rec.GetFilter("Source Document No.");

            if SalesOrderNo <> '' then begin
                if SalesHeader.Get(SalesHeader."Document Type"::Order, SalesOrderNo) then
                    Rec.Validate("Source Document No.", SalesHeader."No.");
            end;
        end;
    end;

    trigger OnDelete()
    var
        ShippingLine: Record "NDS Order Shipping Line";
    begin

        ShippingLine.SetRange("Document No.", "No.");
        if not ShippingLine.IsEmpty() then
            ShippingLine.DeleteAll();

    end;
}