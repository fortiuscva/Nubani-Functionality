page 51605 "NDS Order Shipping Document"
{
    PageType = Document;
    SourceTable = "NDS Order Shipping Header";
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.") { }
                field("Customer Name"; Rec."Customer Name") { }
                field(Salesperson; Rec."Salesperson") { }
                field("Order Date"; Rec."Order Date") { }
                field("Shipping Method"; Rec."Shipping Method") { }
            }

            group("Temperature Control")
            {
                field("Temp Control"; Rec."Temp Control") { }
            }

            group("Special Instructions")
            {
                field("Alternate Shipping Address"; Rec."Alternate Shipping Address") { }
                field("Lift Gate"; Rec."Lift Gate") { }
                field("Notify Appointment"; Rec."Notify Appointment") { }
                field(Other; Rec."Other") { }
            }

            group("Pallet Info")
            {
                field("Pre-Stack Pallet Count"; Rec."Pre-Stack Pallet Count") { }
                field("Stacker Assigned"; Rec."Stacker Assigned") { }
                field("Post-Stack Pallet Count"; Rec."Post-Stack Pallet Count") { }
                field("Reviewed By"; Rec."Reviewed By") { }
            }

            group(Verification)
            {
                field(Wrapper; Rec."Wrapper") { }
                field(Verifier; Rec."Verifier") { }
                field("Verifier Date"; Rec."Verifier Date") { }
            }


            part(PalletLines; "NDS Order Shipping Lines")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                Caption = 'Print Shipping Form';

                trigger OnAction()
                begin
                    // Report.RunModal(Report::"Shipping Form Report", true, true, Rec);
                end;
            }
        }
    }
}