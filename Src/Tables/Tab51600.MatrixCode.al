table 51600 "NDS Matrix Code"
{
    Caption = 'Matrix Code';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; "Table Id"; Integer)
        {
            Caption = 'Table Id';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
