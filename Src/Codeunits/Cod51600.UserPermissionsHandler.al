codeunit 51600 "NDS User Permissions Handler"
{
    procedure GetVisibilityAndEditability(UserID: Code[50]; TableID: Integer; MatrixCode: Text; var IsVisible: Boolean; var IsEditable: Boolean)
    var
        MatrixCodeRec: Record "NDS Matrix Code";
        UserPermMatrixRec: Record "NDS User Permission MatrixCode";
    begin
        IsVisible := true;
        IsEditable := true;

        UserPermMatrixRec.SetRange("User Id", UserID);
        UserPermMatrixRec.SetRange("Matrix Code", MatrixCode); // Only check this matrix code

        if UserPermMatrixRec.FindFirst() then begin
            if MatrixCodeRec.Get(MatrixCode) then begin
                if MatrixCodeRec."Table ID" = TableID then begin
                    IsVisible := UserPermMatrixRec.Visible;
                    IsEditable := UserPermMatrixRec.Editable;
                end;
            end;
        end;
    end;
}
