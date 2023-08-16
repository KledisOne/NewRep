codeunit 50106 "CSD SeminarRegPrinted"
{
    // Chapter 9 - Lab 1-2
    // - Added Codeunit

    TableNo = "CSD Posted Seminar Reg.Header";
    trigger OnRun();
    begin
        Find;
        "No. Printed" += 1;
        Modify;
        Commit;
    end;
}