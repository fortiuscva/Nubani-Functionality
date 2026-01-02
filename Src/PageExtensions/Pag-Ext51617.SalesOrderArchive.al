pageextension 51617 "NDS Sales Order Archive" extends "Sales Order Archive"
{
    layout
    {
        addlast(General)
        {
            field("NDS Driver ID"; Rec."NDS Driver ID")
            {
                ApplicationArea = All;
            }
            field("NDS Driver Name"; Rec."NDS Driver Name")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Driver Name field.', Comment = '%';
            }
        }
    }
}
