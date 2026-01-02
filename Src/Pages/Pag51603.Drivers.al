page 51603 "NDS Drivers"
{
    ApplicationArea = All;
    Caption = 'Drivers';
    PageType = List;
    SourceTable = "NDS Drivers";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Driver ID"; Rec."Driver ID")
                {
                    ToolTip = 'Specifies the value of the Driver ID field.', Comment = '%';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ToolTip = 'Specifies the value of the Driver Name field.', Comment = '%';
                }
            }
        }
    }
}
