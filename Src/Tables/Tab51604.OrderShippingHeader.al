table 51604 "NDS Order Shipping Header"
{
    Caption = 'Order Shipping';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                SalesReceibalesSetup: Record "Sales & Receivables Setup";
                NoSeries: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    SalesReceibalesSetup.Get();
                    NoSeries.TestManual(SalesReceibalesSetup."Shipping Form Nos.");
                    "No. Series" := '';
                end;
            end;
        }

        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            DataClassification = ToBeClassified;
        }

        field(10; "Source Document Type"; Enum "Shipping Source Document Type")
        {
            Caption = 'Source Document Type';
            DataClassification = ToBeClassified;
        }

        field(11; "Source Document No."; Code[20])
        {
            Caption = 'Source Document No.';
            DataClassification = ToBeClassified;
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

        field(20; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }

        field(21; Salesperson; Code[20])
        {
            Caption = 'Salesperson';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;
        }

        field(22; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = ToBeClassified;
        }

        field(23; "Shipping Method"; Code[20])
        {
            Caption = 'Shipping Method';
            DataClassification = ToBeClassified;
        }

        field(30; "Temp Control"; Enum "NDS Temp Control Option")
        {
            Caption = 'Temp Control';
            DataClassification = ToBeClassified;
        }

        field(40; "Alternate Shipping Address"; Boolean)
        {
            Caption = 'Alternate Shipping Address';
            DataClassification = ToBeClassified;
        }

        field(41; "Lift Gate"; Boolean)
        {
            Caption = 'Lift Gate';
            DataClassification = ToBeClassified;
        }

        field(42; "Notify Appointment"; Boolean)
        {
            Caption = 'Notify Appointment';
            DataClassification = ToBeClassified;
        }

        field(43; Other; Boolean)
        {
            Caption = 'Other';
            DataClassification = ToBeClassified;
        }

        field(50; "Pre-Stack Pallet Count"; Integer)
        {
            Caption = 'Pre-Stack Pallet Count';
            DataClassification = ToBeClassified;
        }

        field(51; "Stacker Assigned"; Text[50])
        {
            Caption = 'Stacker Assigned';
            DataClassification = ToBeClassified;
        }

        field(52; "Post-Stack Pallet Count"; Integer)
        {
            Caption = 'Post-Stack Pallet Count';
            DataClassification = ToBeClassified;
        }

        field(53; "Reviewed By"; Text[50])
        {
            Caption = 'Reviewed By';
            DataClassification = ToBeClassified;
        }

        field(60; Wrapper; Text[100])
        {
            Caption = 'Wrapper';
            DataClassification = ToBeClassified;
        }

        field(61; Verifier; Text[50])
        {
            Caption = 'Verifier';
            DataClassification = ToBeClassified;
        }

        field(62; "Verifier Date"; Date)
        {
            Caption = 'Verifier Date';
            DataClassification = ToBeClassified;
        }

        field(70; Notes; Text[250])
        {
            Caption = 'Notes';
            DataClassification = ToBeClassified;
        }
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
        SalesReceibalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if "No." <> xRec."No." then begin
            SalesReceibalesSetup.Get();
            NoSeries.TestManual(SalesReceibalesSetup."Shipping Form Nos.");
            "No. Series" := '';
        end;
    end;
}