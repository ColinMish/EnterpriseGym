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
            if (!LogIn(password, username))
            {
                $("#fail").show();
            }
            else
            {
                window.location = "Home";
            }
        }
    });


    function LogIn(password, username)
    {
        var returnValue = false;
        $.ajax({
            type: "POST",
            url: "LogIn",
            async: false,
            data: {password: password, username: username},
            cache: false,
            success: function (result) {
                if (result === "success")
                {
                    returnValue = true;
                }else{
                    loginfailed();
                }
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
