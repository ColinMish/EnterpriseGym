/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var myId;
var eventId;

function signUp(id,eventid)
{
    window.alert(id+eventid);
     $.ajax({
        type: "POST",
        url: "/SignUpEvent",
        data: { id: id, eventid : eventid},
        cache: false,
        success: function (data) {
            if(data==1)
            {
                //Data has been deleted.
                //Confirmation then reload the page. 
                successSignUpModal(); 
            }else{
                failureSignUpModal();
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

function leaveEvent()
{
     $.ajax({
        type: "DELETE",
        url: "../Events/NotGoing/"+myId+eventid,
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

function checkDelete(id,eventid)
{
        window.alert(id+eventid);
        $("#modalmessage").text("Are you sure you want to leave this event ?");
        this.myId=id;
        this.eventId=eventid;
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

function successSignUpModal()
{
    $("#modalmessage2").text("Sign up succeded.");
    $('#myModal2').modal('show');
}

function failureSignUpModal()
{
    $("#modalmessage3").text("Failed to sign up please try again.");
    $('#myModal3').modal('show');
}



function reload()
{
    location.reload(); 
}


