/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function deleteNews(id)
{
     $.ajax({
        type: "DELETE",
        url: "../News/"+id,
        cache: false,
        success: function (data) {
            if(data=1)
            {
                //Data has been deleted.
                window.alert("success");
            }else{
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


