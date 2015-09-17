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
        var questions = [];
        var answers = [];
        $('input:radio').each(function ()
        {
            var $this = $(this), id = $this.attr('id');
            if ($(this).prop('checked')) {
                questions.push($this.attr('class'));
                var answer = $("#A" + id).html();
                answers.push(answer);
                console.log(id);
            }
        });
        GetResults(questions, answers);
    });
});

function GetResults(questions, answers)
{
    $.ajax({
        type: "POST",
        url: "Result",
        data: {anwers : answers, questions : questions},
        cache: false,
        success: function (data) {
            console.log("success");
        },
        fail: function () {

        }
    });
}