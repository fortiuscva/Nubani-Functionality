page 51601 "NDS User Permission Code's"
{
    ApplicationArea = All;
    Caption = 'User Permission Codes';
    PageType = List;
    SourceTable = "NDS User Permission Code's";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    visible = false;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("Permission Code"; Rec."Permission Code")
                {
                    ToolTip = 'Specifies the value of the Matrix Code field.', Comment = '%';
                }
                field(Visible; Rec.Visible)
                {
                    ToolTip = 'Specifies the value of the Visible field.', Comment = '%';
                }
                field("Editable"; Rec.Editable)
                {
                    ToolTip = 'Specifies the value of the Editable field.', Comment = '%';
                }

            }
        }
    }
}
