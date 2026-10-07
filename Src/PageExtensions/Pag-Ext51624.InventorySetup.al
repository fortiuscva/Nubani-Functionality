pageextension 51624 "Inventory Setup" extends "Inventory Setup"
{
    layout
    {
        addlast(General)
        {
            field("NDS Activate Pallet Picking"; Rec."NDS Activate Pallet Picking")
            {
                ApplicationArea = All;
            }
        }
    }
}
