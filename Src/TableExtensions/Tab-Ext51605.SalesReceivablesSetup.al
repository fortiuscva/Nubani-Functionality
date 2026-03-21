tableextension 51605 "NDS Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(51600; "Shipping Form Nos."; Code[20])
        {
            Caption = 'Shipping Form Nos.';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }
}
