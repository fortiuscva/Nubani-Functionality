pageextension 51623 "NDS Invt. Pick Subform" extends "Invt. Pick Subform"
{
    layout
    {
        addafter("Bin Code")
        {
            field("NDS Bin Ranking"; Rec."NDS Bin Ranking")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bin Ranking field.';
            }
            field("NDS Bin Order"; Rec."NDS Bin Order")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bin Order field.';
            }
        }
    }
}
