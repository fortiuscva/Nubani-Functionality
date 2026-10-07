tableextension 51608 "NDS Bin Content" extends "Bin Content"
{
    fields
    {
        field(51602; "NDS Pallet Bin Order"; Integer)
        {
            Caption = 'Pallet Bin Order';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PalletBinOrder; "NDS Pallet Bin Order")
        {
        }
    }
}
