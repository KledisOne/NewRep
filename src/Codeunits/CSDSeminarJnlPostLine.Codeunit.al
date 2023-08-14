codeunit 50132 "CSD Seminar Jnl.-Post Line"
{
    TableNo = "CSD Seminar Journal Line";
    trigger OnRun()
    begin
        RunWithCheck();
        Code(Rec);
    end;

    procedure RunWithCheck(var SeminarJnLine2: Record "CSD Seminar Journal Line");
    var
    begin
        with SeminarJnLine2 do begin
            SeminarJnlLine := SeminarJnLine2;
            Code();
            SeminarJnLine2 := SeminarJnlLine;
        end;
    end;

    procedure Code(var SeminarJnLine2: Record "CSD Seminar Journal Line");
    begin
        with SeminarJnLine2 do begin
        end
    end;
}
