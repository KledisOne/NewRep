report 50101 SeminarRegParticipantList
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Seminar Reg.- Participant List.';
    RDLCLayout = './src/Reports/LABS/layouts/SeminarRegParticipantList.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(SeminarRegistrationHeader;
        SeminarRegistrationHeader)
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Seminar No.";

            column(RoomName_SeminarRegistrationHeader; "Room Name")
            {
                IncludeCaption = true;
            }
            column(Duration_SeminarRegistrationHeader; "Duration")
            {
                IncludeCaption = true;
            }
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(InstructorName_SeminarRegistrationHeader; "Instructor Name")
            {
                IncludeCaption = true;
            }
            column(SeminarName_SeminarRegistrationHeader; "Seminar Name")
            {
                IncludeCaption = true;
            }
            column(Seminar_No_; "Seminar No.")
            {
                IncludeCaption = true;
            }
            column(StartingDate_SeminarRegistrationHeader; "Starting Date")
            {
                IncludeCaption = true;
            }
        }
        dataitem(SeminarRegistrationLine; SeminarRegistrationLine)
        {
            DataItemTableView = sorting("Line No.", "Document No.");

            column(BilltoCustomerNo_SeminarRegistrationLine; "Bill-to Customer No.")
            {
                IncludeCaption = true;
            }
            column(Amount_SeminarRegistrationLine; Amount)
            {
                IncludeCaption = true;
            }
            column(LineDiscount_SeminarRegistrationLine; "Line Discount %")
            {
                IncludeCaption = true;
            }
            column(LineDiscountAmount_SeminarRegistrationLine; "Line Discount Amount")
            {
                IncludeCaption = true;
            }
            column(No_SeminarRegistrationLine; "No.")
            {
                IncludeCaption = true;
            }
            column(ParticipantContactNo_SeminarRegistrationLine; "Participant Contact No.")
            {
                IncludeCaption = true;
            }
            column(ParticipantName_SeminarRegistrationLine; "Participant Name")
            {
                IncludeCaption = true;
            }
            column(SeminarPrice_SeminarRegistrationLine; "Seminar Price")
            {
                IncludeCaption = true;
            }
            column(ToInvoice_SeminarRegistrationLine; "To Invoice")
            {
                IncludeCaption = true;
            }

            // DataItemLink =  = field();
            column(DocumentNo_SeminarRegistrationLine;
            "Document No.")
            {
                IncludeCaption = true;
            }
            column(LineNo_SeminarRegistrationLine; "Line No.")
            {
                IncludeCaption = true;
            }

        }
        dataitem("Company Information"; "Company Information")
        {

            column(Company_Name; Name)
            {
                IncludeCaption = true;
            }
        }
    }
    labels
    {
        SeminarRegistrationHeaderCap = 'Seminar Registration List';
    }

    var
        myInt: Integer;


}