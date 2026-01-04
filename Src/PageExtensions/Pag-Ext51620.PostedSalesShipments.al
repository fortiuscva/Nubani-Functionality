pageextension 51620 "NDS Posted Sales Shipments" extends "Posted Sales Shipments"
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
