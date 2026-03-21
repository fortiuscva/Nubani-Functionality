table 51604 "NDS Order Shipping Header"
{
    Caption = 'Order Shipping';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20]) { }

        field(2; "No. Series"; Code[20])
        {
            Editable = false;
        }

        field(10; "Source Document Type"; Enum "Shipping Source Document Type") { }

        field(11; "Source Document No."; Code[20]) { }

        field(20; "Customer Name"; Text[100]) { }

        field(21; Salesperson; Code[20]) { }

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
    begin
        if "No." = '' then begin

            ShippingSetup.Get();
            ShippingSetup.TestField("Shipping Form Nos.");

            "No. Series" := ShippingSetup."Shipping Form Nos.";

            "No." := NoSeries.GetNextNo(
                        ShippingSetup."Shipping Form Nos.",
                        WorkDate());
        end;
    end;
}