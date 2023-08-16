report 50103 "CSD Create Seminar Invoices"
{
    ApplicationArea = All;
    Caption = 'CSD Create Seminar Invoices';
    UsageCategory = Administration;
    dataset
    {
        dataitem("CSD Seminar Ledger Entry"; "CSD Seminar Ledger Entry")
        {
            trigger OnPreDataItem();
            begin
                if PostingDateReq = 0D then
                    ERROR(Text000);
                if docDateReq = 0D then
                    ERROR(Text001);
                Window.Open(
                Text002 +
                Text003 +
                Text004);
            end;

            trigger OnPostDataItem();
            begin
                Window.Close;
                if SalesHeader."No." = '' then begin
                    Message(Text007);
                end else begin
                    FinalizeSalesInvoiceHeader;
                    if NoofSalesInvErrors = 0 then
                        Message(Text005, NoofSalesInv)
                    else
                        Message(Text006, NoofSalesInvErrors)
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PostingDateReq; PostingDateReq)
                    {
                        Caption = 'Posting Date';
                    }
                    field(docDateReq; docDateReq)
                    {
                        Caption = 'document Date';
                    }
                    field(CalcInvoiceDiscount; CalcInvoiceDiscount)
                    {
                        Caption = 'Calc. Inv. Discount';
                    }
                    field(PostInvoices; PostInvoices)
                    {
                        Caption = 'Post Invoices';
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
        trigger OnOpenPage();
        begin
            if PostingDateReq = 0D then
                PostingDateReq := WorkDate;
            if docDateReq = 0D then
                docDateReq := WorkDate;
            SalesSetup.Get;
            CalcInvoiceDiscount := SalesSetup."Calc. Inv. Discount";
        end;

        trigger OnAfterGetRecord();
        begin
            if "CSD Seminar Ledger Entry"."Bill-to Customer No." <> Customer."No." then
                Customer.Get("CSD Seminar Ledger Entry"."Bill-to Customer No.");
            if Customer.Blocked in [Customer.Blocked::All,
            Customer.Blocked::Invoice] then begin
                NoofSalesInvErrors := NoofSalesInvErrors + 1;
            end else begin
                if "CSD Seminar Ledger Entry"."Bill-to Customer No." <>
                SalesHeader."Bill-to Customer No." then begin
                    Window.Update(1, "CSD Seminar Ledger Entry"."Bill-to Customer No.");
                    if SalesHeader."No." <> '' then
                        FinalizeSalesInvoiceHeader;
                    InsertSalesInvoiceHeader;
                end;
                Window.Update(2, "CSD Seminar Ledger Entry"."Seminar Registration No.");
                case "CSD Seminar Ledger Entry".Type of
                    "CSD Seminar Ledger Entry".Type::Resource:
                        begin
                            SalesLine.Type := SalesLine.Type::Resource;
                            case "CSD Seminar Ledger Entry"."Charge Type" of
                                "CSD Seminar Ledger Entry"."Charge Type"::Instructor:
                                    SalesLine."No." := "CSD Seminar Ledger Entry"."Instructor Resource No.";
                                "CSD Seminar Ledger Entry"."Charge Type"::Room:
                                    SalesLine."No." := "CSD Seminar Ledger Entry"."Room Resource No.";
                                "CSD Seminar Ledger Entry"."Charge Type"::Participant:
                                    SalesLine."No." := "CSD Seminar Ledger Entry"."Instructor Resource No.";
                            end;
                        end;
                end;
                SalesLine."document Type" := SalesHeader."document Type";
                SalesLine."document No." := SalesHeader."No.";
                SalesLine."Line No." := NextLineNo;
                SalesLine.Validate("No.");
                Seminar.Get("CSD Seminar Ledger Entry"."Seminar No.");
                if "CSD Seminar Ledger Entry".Description <> '' then
                    SalesLine.Description := "CSD Seminar Ledger Entry".
                    Description
                else
                    SalesLine.Description := Seminar.Name;
                SalesLine."Unit Price" := "CSD Seminar Ledger Entry"."Unit Price";
                if SalesHeader."Currency Code" <> '' then begin
                    SalesHeader.TestField("Currency Factor");
                    SalesLine."Unit Price" :=
                    ROUND(CurrencyExchRate.ExchangeAmtLCYTofCY(
                    WorkDate, SalesHeader."Currency Code",
                    SalesLine."Unit Price",
                    SalesHeader."Currency Factor"));
                end;
                SalesLine.Validate(Quantity, "CSD Seminar Ledger Entry".Quantity);
                SalesLine.Insert;
                NextLineNo := NextLineNo + 10000;
            end;
        end;


    }

    local procedure FinalizeSalesInvoiceHeader();
    begin
        with SalesHeader do begin
            if CalcInvoiceDiscount then
                SalesCalcDiscount.Run(SalesLine);
            Get("document Type", "No.");
            Commit;
            Clear(SalesCalcDiscount);
            Clear(SalesPost);
            NoofSalesInv := NoofSalesInv + 1;
            if PostInvoices then begin
                Clear(SalesPost);
                if not SalesPost.Run(SalesHeader) then
                    NoofSalesInvErrors := NoofSalesInvErrors + 1;
            end;
        end;
    end;

    local procedure InsertSalesInvoiceHeader();
    begin
        with SalesHeader do begin
            Init;
            "document Type" := "document Type"::Invoice;
            "No." := '';
            Insert(true);
            Validate("Sell-to Customer No.", "CSD Seminar Ledger Entry"."Bill-to Customer No.");
            if "Bill-to Customer No." <> "Sell-to Customer No."
            then
                Validate("Bill-to Customer No.", "CSD Seminar Ledger Entry"."Bill-to Customer No.");
            Validate("Posting Date", PostingDateReq);
            Validate("document Date", docDateReq);
            Validate("Currency Code", '');
            Modify;
            Commit;
            NextLineNo := 10000;
        end;
    end;

    var
        CurrencyExchRate: Record "Currency Exchange Rate";
        Customer: Record Customer;
        GLSetup: Record "General Ledger Setup";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
        SalesCalcDiscount: Codeunit "Sales-Calc. Discount";
        SalesPost: Codeunit "Sales-Post";
        CalcInvoiceDiscount: Boolean;
        PostInvoices: Boolean;
        NextLineNo: Integer;
        NoofSalesInvErrors: Integer;
        NoofSalesInv: Integer;
        PostingDateReq: Date;
        docDateReq: Date;
        Window: Dialog;
        Seminar: Record "CSD Seminar";
        Text000: Label 'Please enter the posting date.';
        Text001: Label 'Please enter the document date.';
        Text002: Label 'Creating Seminar Invoices...\\';
        Text003: Label 'Customer No. #1##########\';
        Text004: Label 'Registration No. #2##########\';
        Text005: Label 'The number of invoice(s) created is %1.';
        Text006: Label 'not all the invoices were posted. A total of %1 invoices were not posted.';
        Text007: Label 'There is nothing to invoice.';


}
