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
        var results = [[],[]];
        var questions = [];
        var answers = [];
        $('input:radio').each(function ()
        {
            var $this = $(this), id = $this.attr('id');
            if ($(this).prop('checked')) {
                questions.push($this.attr('class'));
                answers.push($("A" + id).html);
                console.log(id);
            }
        });
    });
});

function GetResults(size)
{
    this.collectAnswers(size);
    $.ajax({
        type: "POST",
        url: "Result",
        data: string,
        cache: false,
        success: function (data) {
        },
        fail: function () {

        }
    });
}