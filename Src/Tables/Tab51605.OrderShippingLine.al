table 51605 "NDS Order Shipping Line"
{
    Caption = 'Order Shipping Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }

        field(10; Length; Decimal)
        {
            Caption = 'Length';
            DataClassification = ToBeClassified;
        }

        field(11; Width; Decimal)
        {
            Caption = 'Width';
            DataClassification = ToBeClassified;
        }

        field(12; Height; Decimal)
        {
            Caption = 'Height';
            DataClassification = ToBeClassified;
        }

        field(13; Weight; Decimal)
        {
            Caption = 'Weight';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}