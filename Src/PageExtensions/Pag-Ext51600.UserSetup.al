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
                RunObject = Page "NDS User Permission MatrixCode";
                RunPageLink = "User ID" = FIELD("User ID");
            }
        }
    }
}
