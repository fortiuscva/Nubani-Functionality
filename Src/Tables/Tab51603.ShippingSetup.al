table 51603 "NDS Shipping Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10]) { }

        field(10; "Shipping Form Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Primary Key") { Clustered = true; }
    }

    procedure GetRecordOnce(): Record "NDS Shipping Setup"
    begin
        if not Get('') then begin
            Init();
            "Primary Key" := '';
            Insert();
        end;
        exit(Rec);
    end;
}