codeunit 51600 "NDS User Permissions Handler"
{
    procedure GetVisibilityAndEditability(UserID: Code[50]; TableId: Integer; MatrixCode: Text; var IsVisible: Boolean; var IsEditable: Boolean)
    var
        MatrixCodeRec: Record "NDS Matrix Code";
        UserPermMatrixRec: Record "NDS User Permission MatrixCode";
    begin
        IsVisible := true;
        IsEditable := true;
        MatrixCodeRec.SetRange(Code, MatrixCode);
        MatrixCodeRec.SetRange("Table Id", TableId);
        if MatrixCodeRec.FindFirst() then
            if UserPermMatrixRec.Get(UserID, MatrixCode) then begin
                IsVisible := UserPermMatrixRec.Visible;
                IsEditable := UserPermMatrixRec.Editable;
            end;
    end;
}
