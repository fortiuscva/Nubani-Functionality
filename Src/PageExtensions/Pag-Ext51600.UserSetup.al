pageextension 51600 "NDS User Setup" extends "User Setup"
{
    actions
    {
        addlast(Navigation)
        {
            action("NDS UserPermissionMatrixCode")
            {
                ApplicationArea = All;
                Caption = 'User Permission Matrix Code';
                Promoted = true;
                PromotedOnly = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    UserPermMatrixCodePage: Page "NDS User Permission MatrixCode";
                    UserPermMatrixCodeRec: Record "NDS User Permission MatrixCode";
                begin
                    UserPermMatrixCodeRec.SetRange("User ID", Rec."User ID");
                    UserPermMatrixCodePage.SetTableView(UserPermMatrixCodeRec);
                    UserPermMatrixCodePage.RunModal();
                end;
            }
        }
    }
}
