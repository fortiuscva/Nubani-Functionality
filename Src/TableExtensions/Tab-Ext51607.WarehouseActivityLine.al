tableextension 51607 "NDS Warehouse Activity Line" extends "Warehouse Activity Line"
{
    fields
    {
        field(51600; "NDS Bin Ranking"; Integer)
        {
            Caption = 'Bin Ranking';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup("Bin Content"."Bin Ranking" where("Location Code" = field("Location Code"), "Bin Code" = field("Bin Code")));
        }
        field(51601; "NDS Bin Order"; Integer)
        {
            Caption = 'Bin Order';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(Bin."Bin Order" where("Location Code" = field("Location Code"), Code = field("Bin Code")));
        }
    }
}
