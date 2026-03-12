page 51604 "NDS Shipping Setup"
{
    PageType = Card;
    SourceTable = "NDS Shipping Setup";
    UsageCategory = Administration;
    ApplicationArea = all;
    Caption = 'Shipping Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Shipping Form Nos."; Rec."Shipping Form Nos.") { }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.GetRecordOnce();
    end;
}