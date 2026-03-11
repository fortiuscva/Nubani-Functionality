page 51606 "NDS Order Shipping Lines"
{
    PageType = ListPart;
    SourceTable = "NDS Order Shipping Line";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Length; Rec.Length) { }
                field(Width; Rec.Width) { }
                field(Height; Rec.Height) { }
                field(Weight; Rec.Weight) { }
            }
        }
    }
}