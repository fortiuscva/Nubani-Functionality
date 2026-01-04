table 51602 "NDS Drivers"
{
    Caption = 'Drivers';
    DataClassification = CustomerContent;
    DrillDownPageId = "NDS Drivers";
    LookupPageId = "NDS Drivers";

    fields
    {
        field(1; "Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = CustomerContent;
        }
        field(2; "Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Driver ID")
        {
            Clustered = true;
        }
    }
}
