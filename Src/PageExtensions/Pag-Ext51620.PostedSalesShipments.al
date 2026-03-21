pageextension 51620 "NDS Posted Sales Shipments" extends "Posted Sales Shipments"
{
    layout
    {
        addlast(Control1)
        {
            field("NDS Driver ID"; Rec."NDS Driver ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Driver ID field.', Comment = '%';
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
