pageextension 51622 "NDS Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("NDS Shipping Form Nos."; Rec."Shipping Form Nos.")
            {
                ApplicationArea = all;
            }
        }
    }
}
