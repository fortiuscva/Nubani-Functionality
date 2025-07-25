page 51600 "NDS Matrix Code"
{
    ApplicationArea = All;
    Caption = 'Matrix Code';
    PageType = List;
    SourceTable = "NDS Matrix Code";
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
