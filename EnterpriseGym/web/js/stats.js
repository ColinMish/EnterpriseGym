/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function ()
{
    loadColumns("user");
    pie("Total site users", "users", "[{name: \"total\", y: 100}]");

    //eventHandlers
    $("#userproperty").change(function (e) {
        getUsersBy(e.target.options[e.target.selectedIndex].text);
    });
});

function loadColumns(tableName)
{
    $.ajax({
        type: "GET",
        url: "Stats/" + tableName,
        success: function (data) {
            console.log(data);
            $.each($.parseJSON(data), function (idx, obj) {
                $("#userproperty").append(new Option(obj, obj));
            });
        },
        fail: function () {
            console.log("Ajax error");
        }
    });
}

function getUsersBy(field)
{
    $.ajax({
        type: "GET",
        url: "Data/user/" + field,
        success: function (data) {
            console.log(data);
            pie("users by " + field, field, data);
        },
        fail: function () {
            console.log("Ajax error");
        }
    });
}