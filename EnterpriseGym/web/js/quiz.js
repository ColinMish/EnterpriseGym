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
        if (answers === null)
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
            var results = $.map(data, function (el) {
                return el;
            });
            var ps = getScore(results);
            $("#mainTitle").text("Results");
            var percent = ((ps[0] / ps[1]) * 100);
            if (percent >= 80)
            {
                $("#quizTitle").text("Pass " + ps[0] + "\\" + ps[1] + " (" + percent + "%)");
            }
            else
            {
                $("#quizTitle").text("Fail " + ps[0] + "\\" + ps[1] + " (" + percent + "%)");
            }
            var html = getHtmlResult(results);
            $(".panel-body").replaceWith(html);
        },
        fail: function () {

        }
    });
}

function getHtmlResult(results)
{
    var count = 0;
    var html = "<div class=\"panel-body\"><ol>";
    results.forEach(function (i)
    {
        var mark = "correct";
        count++;
        if(i === false)
        {
            mark = "incorrect";
        }
        html = html + "<li> Answer = " + mark + "</li><br>";
    });
    html = html + "</ol><a href=\"../Quizes\" class=\"btn btn-default\">Back</a></div>";
    return html;
}

function getScore(results)
{
    var total = results.length;
    var correct = 0;
    results.forEach(function (i)
    {
        if (i)
        {
            correct++;
        }
    });
    var score = [correct, total];
    return score;
}

function ValidateQuiz()
{
    var answers = [];
    var question;
    var count = 0;
    var valid = false;
    $('input:radio').each(function ()
    {
        var $this = $(this), id = $this.attr('id');
        ;
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
    if (answers === null)
    {
        $("#modalHeader").text("Error!");
        $("#modalText").text("You must answer all the qustions to submit the quiz.");
        $('#myModal').modal('show');
    }
    return answers;
}