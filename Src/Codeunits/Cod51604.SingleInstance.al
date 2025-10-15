codeunit 51604 "NDS Single Instance"
{
    SingleInstance = true;

    procedure SetSuppressWhseMgmtWarningMsg(SuppressWhseMgmtWarningMsgPar: Boolean)
    begin
        SuppressWhseMgmtWarningMsg := SuppressWhseMgmtWarningMsgPar;
    end;

    procedure GetSuppressWhseMgmtWarningMsg(): Boolean
    begin
        exit(SuppressWhseMgmtWarningMsg);
    end;

    var
        SuppressWhseMgmtWarningMsg: Boolean;

}
