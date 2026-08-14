report 51603 "NDS Update Bank Ledger Entry"
{
    Caption = 'Update Bank Account Ledger Entries';
    ProcessingOnly = true;
    ApplicationArea = All;
    UsageCategory = Tasks;
    Permissions = tabledata "Bank Account Ledger Entry" = RIMD;

    dataset
    {
        dataitem(BankLedgerEntry; "Bank Account Ledger Entry")
        {
            RequestFilterFields = "Entry No.";

            trigger OnPreDataItem()
            begin
                if GetFilter("Entry No.") = '' then
                    Error('Please enter an Entry No.');
            end;

            trigger OnAfterGetRecord()
            begin
                BankLedgerEntry."Remaining Amount" := 0;
                BankLedgerEntry.Open := false;
                BankLedgerEntry.Validate("Statement Status", BankLedgerEntry."Statement Status"::Closed);
                BankLedgerEntry.Modify(true);
                UpdatedCount += 1;
            end;

            trigger OnPostDataItem()
            begin
                Message('%1 ledger entrie(s) updated.', UpdatedCount);
            end;
        }
    }

    var
        UpdatedCount: Integer;

}

