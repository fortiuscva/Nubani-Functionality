page 51606 "NDS Order Shipping Lines"
{
    PageType = ListPart;
    SourceTable = "NDS Order Shipping Line";
    AutoSplitKey = true;
    Caption = 'Order Shipping Lines';
    ApplicationArea = all;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Length; Rec.Length)
                {
                    ApplicationArea = all;
                }
                field(Width; Rec.Width)
                {
                    ApplicationArea = all;
                }
                field(Height; Rec.Height)
                {
                    ApplicationArea = all;
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}