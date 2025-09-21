pageextension 51613 "NDS Sales Order" extends "Sales Order"
{
    layout
    {
        addlast(content)
        {
            part(ChangeLogEntries; "NDS Sales Order Change Log")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                Enabled = false;
                SubPageLink = "Primary Key Field 2 Value" = field("No.");
            }
        }
    }
}
