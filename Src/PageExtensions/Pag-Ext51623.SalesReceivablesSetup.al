pageextension 51623 "NDS Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Shipping Form Nos."; Rec."Shipping Form Nos.")
            {
                ApplicationArea = all;
            }
        }
    }
}
