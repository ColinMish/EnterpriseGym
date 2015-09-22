/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    $(".error").hide();

    $("#reset").submit(function (e)
    {
        var email = $("#em").val();
        var username = $("#user").val();
        var validEmail = validateEmail(email, username);

        if (validEmail === "false")
        {
            e.preventDefault();
            $(".error").show();
        }
    });
});


function validateEmail(email, username)
{
    var validEmail = false;
    $.ajax({
        type: "POST",
        url: "CheckPassword",
        async: false,
        data: {username: username, email: email},
        cache: false,
        success: function (result) {
            validEmail = result;
        },
        fail: function () {
            console.log("Error in ajax call");
        }
    });
    return validEmail;
}