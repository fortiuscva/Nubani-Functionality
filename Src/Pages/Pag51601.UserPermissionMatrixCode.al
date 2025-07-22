page 51601 "NDS User Permission MatrixCode"
{
    ApplicationArea = All;
    Caption = 'User Permission Matrix Code';
    PageType = List;
    SourceTable = "NDS User Permission MatrixCode";
    UsageCategory = ReportsAndAnalysis;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("Matrix Code"; Rec."Matrix Code")
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
