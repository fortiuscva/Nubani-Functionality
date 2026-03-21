report 51601 "NDS Order Shipping Print"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Order Shipping Form';
    DefaultLayout = rdlc;
    RDLCLayout = './Src/Reports/Layout/OrderShippingForm.rdl';

    dataset
    {
        dataitem(Header; "NDS Order Shipping Header")
        {
            RequestFilterFields = "No.";

            column(No_; "No.") { }
            column(No_Caption; FieldCaption("No.")) { }

            column(SourceDocNo; "Source Document No.") { }
            column(SourceDocNo_Caption; OrderLbl) { }

            column(CustomerName; "Customer Name") { }
            column(CustomerName_Caption; CustomerNameLbl) { }

            column(Salesperson; "Salesperson") { }
            column(Salesperson_Caption; SalespersonLbl) { }

            column(OrderDate; Format("Order Date")) { }
            column(OrderDate_Caption; OrderDateLbl) { }

            column(ShippingMethod; "Shipping Method") { }
            column(ShippingMethod_Caption; ShippingMethodLbl) { }

            column(TempControl; TempControlVar) { }
            column(TempControl_Caption; TempControlLbl) { }

            column(PreStack; "Pre-Stack Pallet Count") { }
            column(PreStack_Caption; PreStackPalletCountLbl) { }

            column(PostStack; "Post-Stack Pallet Count") { }
            column(PostStack_Caption; PostStackPalletCountLbl) { }

            column(Stacker; "Stacker Assigned") { }
            column(Stacker_Caption; StackerAssignedLbl) { }

            column(ReviewedBy; "Reviewed By") { }
            column(ReviewedBy_Caption; ReviewedByLbl) { }

            column(Wrapper; "Wrapper") { }
            column(Wrapper_Caption; WrapperLbl) { }

            column(Verifier; "Verifier") { }
            column(Verifier_Caption; VerifierLbl) { }

            column(Notes; NotesTxt) { }
            column(Lift_Gate; BoolToYN("Lift Gate")) { }
            column(Notify_Appointment; BoolToYN("Notify Appointment")) { }
            column(Other; BoolToYN(Other)) { }
            column(Notes_Caption; NotesLbl) { }
            column(Alternate_Shipping_Address; BoolToYN("Alternate Shipping Address")) { }
            column(Verifier_Date; Format("Verifier Date")) { }
            column(VerifierDate_Caption; VerifierDateLbl) { }
            column(CompanyInfoPicture; CompanyInfo.Picture) { }

            dataitem(Lines; "NDS Order Shipping Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.");

                column(LineNo;
                "Line No.")
                { }

                column(Length; Length) { }
                column(Length_Caption; FieldCaption(Length)) { }

                column(Width; Width) { }
                column(Width_Caption; FieldCaption(Width)) { }

                column(Height; Height) { }
                column(Height_Caption; FieldCaption(Height)) { }

                column(Weight; Weight) { }
                column(Weight_Caption; FieldCaption(Weight)) { }
            }
            trigger OnAfterGetRecord()
            begin
                NotesTxt := Header.GetNotes();

                case
                    Header."Temp Control" of
                    "NDS Temp Control Option"::No:
                        TempControlVar := 0;
                    "NDS Temp Control Option"::YEs:
                        TempControlVar := 1;
                    "NDS Temp Control Option"::TBD:
                        TempControlVar := 2;
                end;
            end;
        }
    }

    trigger OnInitReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";

    local procedure BoolToYN(Value: Boolean): Text[1]
    begin
        if Value then
            exit('Y')
        else
            exit('N');
    end;

    var
        NotesTxt: Text;
        TempControlVar: Integer;
        CustomerNameLbl: Label 'CUSTOMER NAME:';
        SalespersonLbl: Label 'SALESPERSON:';
        OrderLbl: Label 'ORDER -';
        OrderDateLbl: Label 'DATE:';
        ShippingMethodLbl: Label 'SHIPPING METHOD -';
        TempControlLbl: Label 'TEMP CONTROL';
        PreStackPalletCountLbl: Label 'PRE-STACK PALLET COUNT -';
        StackerAssignedLbl: Label 'STACKER ASSIGNED:';
        PostStackPalletCountLbl: Label 'POST-STACK PALLET COUNT -';
        ReviewedByLbl: Label 'REVIEWED BY:';
        WrapperLbl: Label 'WRAPPER:';
        VerifierLbl: Label 'VERIFIER -';
        VerifierDateLbl: Label 'DATE -';
        NotesLbl: Label 'NOTES:';
}