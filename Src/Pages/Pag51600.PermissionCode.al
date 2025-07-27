page 51600 "NDS Permission Code"
{
    ApplicationArea = All;
    Caption = 'Permission Code';
    PageType = List;
    SourceTable = "NDS Permission Code";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Matrix Code field.', Comment = '%';
                }
                field("Table ID"; Rec."Table ID")
                {
                    ToolTip = 'Specifies the value of the Table ID field.', Comment = '%';
                }
            }
        }
    }
}
