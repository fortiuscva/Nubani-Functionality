pageextension 51613 "NDS Sales Order" extends "Sales Order"
{
    layout
    {
        addlast(content)
        {
            part(ChangeLogEntries; "NDS Sales Order Change Log")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                Enabled = false;
                SubPageLink = "Primary Key Field 2 Value" = field("No.");
            }
        }
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
        addlast(Category_Process)
        {
            actionref(OrderShipping; "NDS Order Shipping")
            {
            }
        }
    }
}

