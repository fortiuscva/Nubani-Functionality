page 51602 "NDS Sales Order Change Log"
{
    ApplicationArea = All;
    Caption = 'Change Log';
    PageType = ListPart;
    SourceTable = "Change Log Entry";
    UsageCategory = None;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    SourceTableView = where("Table No." = filter('36|37'), "Primary Key Field 1 Value" = filter(1));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Date and Time"; Rec."Date and Time")
                {
                    ToolTip = 'Specifies the date and time when this change log entry was created.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                }
                field("Table Caption"; Rec."Table Caption")
                {
                    ToolTip = 'Specifies the name of the table containing the changed field.';
                }
                field("Primary Key Field 1 Value"; Rec."Primary Key Field 1 Value")
                {
                    ToolTip = 'Specifies the value of the first primary key for the changed field.';
                }
                field("Primary Key Field 2 Value"; Rec."Primary Key Field 2 Value")
                {
                    ToolTip = 'Specifies the value of the second primary key for the changed field.';
                }
                field("Field Caption"; Rec."Field Caption")
                {
                    ToolTip = 'Specifies the field caption of the changed field.';
                }
                field("Type of Change"; Rec."Type of Change")
                {
                    ToolTip = 'Specifies the type of change made to the field.';
                }
                field("Old Value"; Rec."Old Value")
                {
                    ToolTip = 'Specifies the value of the Old Value field.', Comment = '%';
                }
                field("New Value"; Rec."New Value")
                {
                    ToolTip = 'Specifies the value of the New Value field.', Comment = '%';
                }
            }
        }
    }
}
