/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function ()
{
    $(".forgotPassword").hide();
    $("#fail").hide();
    $("#invalid").hide();
    var loginCount = 0;

    $("#logInForm").submit(function (e)
    {
        e.preventDefault();
        var username = $("#un").val();
        var password = $("#pw").val();
        console.log(loginCount);
        if (username === '' || password === '')
        {
            $("#invalid").show();
        }
        else if (loginCount === 3)
        {
            $(".forgotPassword").show();
            loginCount = 0;
        }
        else
        {
            loginCount++;
            var result = LogIn(password, username);
            if (result === "success")
            {
                window.location = "Home";
            }
            else if (result === "failed")
            {
                loginfailed();
                $("#fail").show();
            }
            else
            {
                window.location = "SignUp/Temp/" + result;
            }
        }
    });


    function LogIn(password, username)
    {
        var returnValue = "";
        $.ajax({
            type: "POST",
            url: "LogIn",
            async: false,
            data: {password: password, username: username},
            cache: false,
            success: function (result) {
                returnValue = result;
            },
            fail: function () {
                console.log("Ajax error");
            }
        });
        return returnValue;
    }
});

function loginfailed()
{
    //Show modal if the log in fails.
    $("#modalHeader").text("Error");
    $("#modalText").text("Log in failed. Please try again.");
    $('#myModal').modal('show');
}
