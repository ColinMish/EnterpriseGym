/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function ()
{
    $("#quizForm").submit(function (e)
    {
        e.preventDefault();
        var quizTitle = $("#quizTitle").text();
        var answers = ValidateQuiz();
        if(answers === null)
            return;
        GetResults(quizTitle, answers);
    });
});

function GetResults(quizTitle, answers)
{
    $.ajax({
        type: "POST",
        url: "Result",
        data: {quizTitle: quizTitle, answers: answers},
        cache: false,
        success: function (data) {
            console.log("success");
        },
        fail: function () {

        }
    });
}

function ValidateQuiz()
{
    var answers = [];
    var question;
    var count = 0;
    var valid = false;
    $('input:radio').each(function ()
    {
        var $this = $(this), id = $this.attr('id');;
        var thisQuestion = $this.attr('class');
        if (question !== thisQuestion)
        {
            question = thisQuestion;
            if (!valid && count !== 0)
            {
                answers = null;
                return valid;
            }
            count++;
            valid = false;
        }

        if ($(this).prop('checked'))
        {        
            valid = true;
            var answer = $("#A" + id).html();
            answers.push(answer);
        }
    });
    if(answers === null)
    {
        alert("You must answer all questions to submit the quiz!");
    }
    return answers;
}