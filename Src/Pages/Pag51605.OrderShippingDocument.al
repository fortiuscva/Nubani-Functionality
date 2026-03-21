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
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
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
                field("Source Document No."; Rec."Source Document No.")
                {
                    ToolTip = 'Specifies the value of the Source Document No. field.', Comment = '%';
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
                group(NDSNotes)
                {
                    Caption = 'Notes';
                    field(Notes; NotesTxt)
                    {
                        ApplicationArea = all;
                        Caption = 'Notes';
                        Importance = Additional;
                        MultiLine = true;
                        ShowCaption = false;
                        ToolTip = 'Specifies the products or service being offered.';

                        trigger OnValidate()
                        begin
                            Rec.SetNotes(NotesTxt);
                        end;
                    }
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
    trigger OnAfterGetRecord()
    begin
        NotesTxt := Rec.GetNotes();
    end;

    var
        NotesTxt: Text;
}