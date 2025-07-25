table 51601 "NDS User Permission MatrixCode"
{
    DataClassification = ToBeClassified;
    Caption = 'User Permission Matrix Code';

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }

        field(2; "Matrix Code"; Code[50])
        {
            Caption = 'Matrix Code';
            TableRelation = "NDS Matrix Code".Code;
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
        key(PK; "User ID", "Matrix Code")
        {
            Clustered = true;
        }
    }
}
