/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var myId;

$(document).ready(function ()
{
    $("#TempSignUp").submit(function (e)
    {
        e.preventDefault();
        var firstName = $("#firstName").val();
        var lastName = $("#lastName").val();
        var email = $("#email").val();
        tempSignUp(firstName, lastName, email);
    });
    
    var myElement = document.getElementById('editor1');
    if(myElement!==null){
        CKEDITOR.replace('editor1');
    }
    
   var myElement1 = document.getElementById('eventDescription');
    if(myElement1 !==null){
 CKEDITOR.replace('eventDescription');
    }
 
 

             $("#editNews").click(function ()
            {
                window.location = "Admin/News";
            });
            
            $("#newsPanel").click(function () {
                $("#newsEditor").toggle("fast", function () {
                });
            });
            
              $("#editAccount").click(function ()
            {
                window.location = "Admin/Account";
            });
            $("#userPanel").click(function () {
                $("#userEditor").toggle("fast", function () {
                });
            });
            
              $(function () {
              $('#datetimepicker1').datetimepicker();
              $('#datetimepicker2').datetimepicker();
              });
              
                 $("#editEvent").click(function ()
            {
                window.location = "Admin/Event";
            });
            $("#eventsPanel").click(function () {
                $("#eventsEditor").toggle("fast", function () {
                });
            });
            
              $("#quizPanel").click(function () {
                $("#quizEditor").toggle("fast", function () {
                });
            });
            
              $("#quickRegisterPanel").click(function () {
                $("#quickRegisterEditor").toggle("fast", function () {
                });
            });
            
              $("#stats").click(function () {
                window.location = "Stats";
            });
            $("#leaderboard").click(function(){
                window.location ="Admin/Leaderboard";
            });
             
    
    
});

function deleteNews()
{
    $.ajax({
        type: "DELETE",
        url: "../News/" + myId,
        cache: false,
        success: function (data) {
            if (data == 1)
            {
                //Data has been deleted.
                //Confirmation then reload the page. 
                successModal();
            } else {
                failureModal();
                //Data not deleted.
            }
            //Show success then reload the page. 
        },
        fail: function () {
            window.alert("Failed");
            //Show failure. 
        }
    });
}

function checkDelete(id, title)
{
    $("#modalmessage").text("Are you sure you want to delete the article: " + title + "?");
    this.myId = id;
    $('#myModal').modal('show');
}

function successModal()
{
    $("#modalmessage2").text("The content has been deleted.");
    $('#myModal2').modal('show');
}

function failureModal()
{
    $("#modalmessage3").text("The content has not been deleted.");
    $('#myModal3').modal('show');
}

function reload()
{
    location.reload();
}

function tempSignUp(firstName, lastName, email)
{
    $.ajax({
            type: "POST",
            url: "SignUp/Temp",
            async: false,
            data: {firstName: firstName, lastName: lastName, email : email},
            cache: false,
            success: function (result) {
                if (result === "true")
                {
                    $("#message").text("A tempory account has been set up. Please check your emails for access");
                }else{
                    $("#message").text("Tempory account creation failed. Please try again or go to register");
                }
            },
            fail: function () {
                console.log("Ajax error");
            }
        });
}

function deleteEvent()
{
        $.ajax({
        type: "DELETE",
        url: "../Events/DeleteEvent/"+myId,
        cache: false,
        success: function (data) {
            if(data==1)
            {
                //Data has been deleted.
                //Confirmation then reload the page. 
                successModal(); 
            }else{
                failureModal();
                //Data not deleted.
            }
        //Show success then reload the page. 
        },
        fail: function () {
            window.alert("Failed");
        //Show failure. 
        }
    });
}

 