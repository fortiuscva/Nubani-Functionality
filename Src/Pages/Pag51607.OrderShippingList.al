page 51607 "NDS Order Shipping List"
{
    PageType = List;
    SourceTable = "NDS Order Shipping Header";
    CardPageId = "NDS Order Shipping Document";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.") { }
                field("Source Document Type"; Rec."Source Document Type") { }
                field("Source Document No."; Rec."Source Document No.") { }
                field("Customer Name"; Rec."Customer Name") { }
                field("Order Date"; Rec."Order Date") { }
            }
        }
    }
}