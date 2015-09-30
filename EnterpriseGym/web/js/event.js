/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var myId;
var eventId;

function signUp(id,eventid)
{
     $.ajax({
        type: "POST",
        url: ctx+"/SignUpEvent",
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
        },
         error: function(jqXHR, textStatus, errorThrown) {
        console.log(JSON.stringify(jqXHR));
        console.log("AJAX error: " + textStatus + ' : ' + errorThrown);
 }
    });
}

function leaveEvent()
{
     $.ajax({
        type: "DELETE",
        url: ctx+"/Events/NotGoing/"+myId+"/"+eventId,
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
        }, error: function(jqXHR, textStatus, errorThrown) {
        console.log(JSON.stringify(jqXHR));
        console.log("AJAX error: " + textStatus + ' : ' + errorThrown);
 }
    });
}

function checkDelete(id,eventid)
{
        this.myId=id;
        this.eventId=eventid;
        $("#modalmessage").text("Are you sure you want to leave this event?");
        
        $('#myModal').modal('show');
}

function successModal()
{
    $("#modalmessage2").text("You can always sign up again if you change your mind.");
    $('#myModal2').modal('show');
}

function failureModal()
{
    $("#modalmessage3").text("Server error please try again.");
    $('#myModal3').modal('show');
}

function successSignUpModal()
{
    $("#modalmessage2").text("You have now signed up for the event. We look forward to seeing you there!");
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


