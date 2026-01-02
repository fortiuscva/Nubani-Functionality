pageextension 51621 "NDS Sales Order Archives" extends "Sales Order Archives"
{
    layout
    {
        addlast(Control1)
        {
            field("NDS Driver ID"; Rec."NDS Driver ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Driver ID field.', Comment = '%';
            }
        }
    }
}
