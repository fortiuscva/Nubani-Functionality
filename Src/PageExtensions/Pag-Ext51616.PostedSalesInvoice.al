pageextension 51616 "NDS Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("NDS Driver ID"; Rec."NDS Driver ID")
            {
                ApplicationArea = All;
            }
            field("NDS Driver Name"; Rec."NDS Driver Name")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Driver Name field.', Comment = '%';
            }
        }
    }
    actions
    {
        addlast(Navigation)
        {
            action("NDS ShippingForms")
            {
                Caption = 'Shipping Forms';
                Image = List;
                ApplicationArea = All;

                RunObject = page "NDS Order Shipping List";
                RunPageLink = "Source Document No." = field("Order No.");
            }
        }
    }
}
