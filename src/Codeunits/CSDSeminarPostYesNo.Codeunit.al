codeunit 50104 "CSD SeminarPost (Yes/No)"
{
    local procedure MessageYesNo()
    var
        Question: Text;
        Answer: Boolean;
        Text000: Label 'Do you want to post the registration?';
        Text001: Label 'You selected %1.';
        SeminarPost: Codeunit "CSD SeminarPost";
    begin
        Question := Text000;
        Answer := Dialog.Confirm(Question, true);
        Message(Text001, Answer);
        SeminarPost.Run();
    end;
}
