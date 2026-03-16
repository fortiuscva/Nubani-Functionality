page 51605 "NDS Order Shipping Document"
{
    PageType = Document;
    SourceTable = "NDS Order Shipping Header";
    UsageCategory = Documents;
    ApplicationArea = All;
    Caption = 'Order Shipping Document';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = false;
                field("No."; Rec."No.")
                {

                    trigger OnAssistEdit()
                    var
                        SalesReceibalesSetup: Record "Sales & Receivables Setup";
                        NoSeries: Codeunit "No. Series";
                    begin

                        SalesReceibalesSetup.Get();
                        SalesReceibalesSetup.TestField("Shipping Form Nos.");

                        if NoSeries.LookupRelatedNoSeries(
                            SalesReceibalesSetup."Shipping Form Nos.",
                            Rec."No. Series",
                            Rec."No.") then begin
                            Rec.Validate("No.");
                        end;
                    end;

                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                }
                field(Salesperson; Rec."Salesperson")
                {
                    ApplicationArea = all;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = all;
                }
                field("Shipping Method"; Rec."Shipping Method")
                {
                    ApplicationArea = all;
                }
            }

            group("Temperature Control")
            {
                field("Temp Control"; Rec."Temp Control")
                {
                    ApplicationArea = all;
                }
            }

            group("Special Instructions")
            {
                field("Alternate Shipping Address"; Rec."Alternate Shipping Address")
                {
                    ApplicationArea = all;
                }
                field("Lift Gate"; Rec."Lift Gate")
                {
                    ApplicationArea = all;
                }
                field("Notify Appointment"; Rec."Notify Appointment")
                {
                    ApplicationArea = all;
                }
                field(Other; Rec."Other")
                {
                    ApplicationArea = all;
                }
            }

            group("Pallet Info")
            {
                field("Pre-Stack Pallet Count"; Rec."Pre-Stack Pallet Count")
                {
                    ApplicationArea = all;
                }
                field("Stacker Assigned"; Rec."Stacker Assigned")
                {
                    ApplicationArea = all;
                }
                field("Post-Stack Pallet Count"; Rec."Post-Stack Pallet Count")
                {
                    ApplicationArea = all;
                }
                field("Reviewed By"; Rec."Reviewed By")
                {
                    ApplicationArea = all;
                }
            }

            group(Verification)
            {
                field(Wrapper; Rec."Wrapper")
                {
                    ApplicationArea = all;
                }
                field(Verifier; Rec."Verifier")
                {
                    ApplicationArea = all;
                }
                field("Verifier Date"; Rec."Verifier Date")
                {
                    ApplicationArea = all;
                }
            }


            part(PalletLines; "NDS Order Shipping Lines")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action(Print)
            {
                Caption = 'Order Shipping Form';

                trigger OnAction()
                var
                    ShippingHeader: Record "NDS Order Shipping Header";
                begin
                    ShippingHeader.Reset();
                    ShippingHeader.SetRange("No.", rec."No.");
                    if ShippingHeader.FindFirst() then
                        Report.RunModal(Report::"NDS Order Shipping Print", true, true, ShippingHeader);
                end;
            }
        }
    }
}