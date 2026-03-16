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
    actions
    {
        addafter("Create Inventor&y Put-away/Pick")
        {
            action("NDS Order Shipping")
            {
                ApplicationArea = All;
                Caption = 'Order Shipping';
                RunObject = Page "NDS Order Shipping List";
                RunPageLink =
        "Source Document No." = field("No.");
            }
        }
        addlast(Category_Process)
        {
            actionref(OrderShipping; "NDS Order Shipping")
            {
            }
        }
    }
}
