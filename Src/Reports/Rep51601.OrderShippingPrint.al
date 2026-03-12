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
            column(SourceDocNo_Caption; FieldCaption("Source Document No.")) { }

            column(CustomerName; "Customer Name") { }
            column(CustomerName_Caption; FieldCaption("Customer Name")) { }

            column(Salesperson; "Salesperson") { }
            column(Salesperson_Caption; FieldCaption("Salesperson")) { }

            column(OrderDate; Format("Order Date")) { }
            column(OrderDate_Caption; FieldCaption("Order Date")) { }

            column(ShippingMethod; "Shipping Method") { }
            column(ShippingMethod_Caption; FieldCaption("Shipping Method")) { }

            column(TempControl; "Temp Control") { }
            column(TempControl_Caption; FieldCaption("Temp Control")) { }

            column(PreStack; "Pre-Stack Pallet Count") { }
            column(PreStack_Caption; FieldCaption("Pre-Stack Pallet Count")) { }

            column(PostStack; "Post-Stack Pallet Count") { }
            column(PostStack_Caption; FieldCaption("Post-Stack Pallet Count")) { }

            column(Stacker; "Stacker Assigned") { }
            column(Stacker_Caption; FieldCaption("Stacker Assigned")) { }

            column(ReviewedBy; "Reviewed By") { }
            column(ReviewedBy_Caption; FieldCaption("Reviewed By")) { }

            column(Wrapper; "Wrapper") { }
            column(Wrapper_Caption; FieldCaption("Wrapper")) { }

            column(Verifier; "Verifier") { }
            column(Verifier_Caption; FieldCaption("Verifier")) { }

            column(Notes; "Notes") { }
            column(Lift_Gate; BoolToYN("Lift Gate")) { }
            column(Notify_Appointment; BoolToYN("Notify Appointment")) { }
            column(Other; BoolToYN(Other)) { }
            column(Notes_Caption; FieldCaption("Notes")) { }
            column(Alternate_Shipping_Address; BoolToYN("Alternate Shipping Address")) { }
            column(Verifier_Date; Format("Verifier Date")) { }
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
}