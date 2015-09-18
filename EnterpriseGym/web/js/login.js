/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function ()
{
    $(".forgotPassword").hide();
    var loginCount = 0;

    $("#logInForm").submit(function (e)
    {
        e.preventDefault();
        if (loginCount === 3)
        {
            $(".forgotPassword").show();
            loginCount = 0;
        }
        else
        {
            loginCount++;
            if (!LogIn())
            {
                $("#logInTitle").text("Log In Failed");
                $("#logInMessage").text("Please try again");
            }
        }
    });


    function LogIn()
    {
        var username = $("#un").val();
        var password = $("#pw").val();

        $.ajax({
            type: "POST",
            url: "LogIn",
            data: {password: password, username: username}, 
            cache: false,
            success: function (fail) {
                return false;
            },
            fail: function () {
                return false;
            }
        });
    }
});
