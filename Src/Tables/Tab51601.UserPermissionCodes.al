table 51601 "NDS User Permission Code's"
{
    DataClassification = ToBeClassified;
    Caption = 'User Permission Codes';

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }

        field(2; "Permission Code"; Code[50])
        {
            Caption = 'Permission Code';
            TableRelation = "NDS Permission Code".Code;
        }

        field(3; Visible; Boolean)
        {
            Caption = 'Visible';
        }

        field(4; "Editable"; Boolean)
        {
            Caption = 'Editable';
        }

    }

    keys
    {
        key(PK; "User ID", "Permission Code")
        {
            Clustered = true;
        }
    }
}
