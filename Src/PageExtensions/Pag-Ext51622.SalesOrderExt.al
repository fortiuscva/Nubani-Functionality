pageextension 51622 "NDS SalesOrderExt" extends "Sales Order"
{
    actions
    {
        addafter("Archive Document")
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
        addlast(Promoted)
        {
            actionref(OrderShipping; "NDS Order Shipping")
            {
            }
        }
    }
}