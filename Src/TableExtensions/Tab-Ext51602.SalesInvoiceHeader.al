tableextension 51602 "NDS Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(51600; "NDS Driver ID"; Code[20])
        {
            Caption = 'Driver ID';
            DataClassification = CustomerContent;
            TableRelation = "NDS Drivers"."Driver ID";
        }
        field(51601; "NDS Driver Name"; Text[50])
        {
            Caption = 'Driver Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("NDS Drivers"."Driver Name" WHERE("Driver ID" = FIELD("NDS Driver ID")));
            Editable = false;
        }
    }
}
