/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var myId;

function deleteNews()
{
     $.ajax({
        type: "DELETE",
        url: "../News/"+myId,
        cache: false,
        success: function (data) {
            if(data===1)
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

function checkDelete(id,title)
{
        $("#modalmessage").text("Are you sure you want to delete the article: "+title+"?");
        this.myId=id;
        $('#myModal').modal('show');
}

function successModal()
{
    $("modaltitle2").text("Success");
    $("#modalmessage2").text("The content has been deleted.");
    $('#myModal2').modal('show');
}

function failureModal()
{
    $("modaltitle3").text("Failure");
    $("#modalmessage3").text("The content has not been deleted.");
    $('#myModal3').modal('show');
}

function reload()
{
    location.reload(); 
}

function deleteEvent()
{
        $.ajax({
        type: "DELETE",
        url: "../Events/"+myId,
        cache: false,
        success: function (data) {
            if(data===1)
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


