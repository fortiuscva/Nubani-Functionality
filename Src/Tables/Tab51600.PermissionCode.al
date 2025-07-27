table 51600 "NDS Permission Code"
{
    Caption = 'Permission Code';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[100])
        {
            Caption = 'Code';
        }
        field(2; "Page ID"; Integer)
        {
            Caption = 'Page ID';
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
