/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function deleteNews(id)
{
     $.ajax({
        type: "DELETE",
        url: "../News",
        data: {id: id},
        cache: false,
        success: function (data) {
        //Show success then reload the page. 
        },
        fail: function () {
        //Show failure. 
        }
    });
}


