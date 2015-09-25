/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Attend(id,eventid)
{
     $.ajax({
        type: "POST",
        url: ctx+"/EventAttended",
        data: { id: id, eventid : eventid},
        cache: false,
        success: function (data) {
            if(data==1)
            {
                //Data has been deleted.
                //Confirmation then reload the page. 
                userAttended(id); 
            }else{
                failureModal();
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

function failureModal()
{
    $("#modalmessage3").text("Failed to reach server please try again.");
    $('#myModal3').modal('show');
}





function userAttended(id)
{
    $("#notattending"+id).addClass('hidden');
    $('#attending'+id).removeClass('hidden');
}


