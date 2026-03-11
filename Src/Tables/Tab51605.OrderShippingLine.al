table 51605 "NDS Order Shipping Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20]) { }

        field(2; "Line No."; Integer) { }

        field(10; Length; Decimal) { }

        field(11; Width; Decimal) { }

        field(12; Height; Decimal) { }

        field(13; Weight; Decimal) { }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}