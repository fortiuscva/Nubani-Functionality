pageextension 51618 "NDS Sales Order List" extends "Sales Order List"
{
    layout
    {
        addlast(Control1)
        {
            field("NDS Driver ID"; Rec."NDS Driver ID")
            {
                ApplicationArea = All;
            }
        }
    }
}
