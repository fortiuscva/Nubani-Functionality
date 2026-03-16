page 51607 "NDS Order Shipping List"
{
    PageType = List;
    SourceTable = "NDS Order Shipping Header";
    CardPageId = "NDS Order Shipping Document";
    UsageCategory = Lists;
    Caption = 'Order Shipping List';
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    DelayedInsert = true;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Source Document Type"; Rec."Source Document Type")
                {
                    ApplicationArea = all;
                }
                field("Source Document No."; Rec."Source Document No.")
                {
                    ApplicationArea = all;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(Reporting)
        {
            action(Print)
            {
                Caption = 'Order Shipping Form';
                ApplicationArea = all;
                Image = Print;
                trigger OnAction()
                var
                    ShippingHeader: Record "NDS Order Shipping Header";
                begin
                    ShippingHeader.Reset();
                    ShippingHeader.SetRange("No.", rec."No.");
                    if ShippingHeader.FindFirst() then
                        Report.RunModal(Report::"NDS Order Shipping Print", true, true, ShippingHeader);
                end;
            }
        }
    }
}