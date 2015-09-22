/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function ()
{
    loadColumns("user");
    displayUserchart("Total site users", "users");

    //eventHandlers
    $("#userproperty").change(function () {
        getUsersBy($("userproperty").val());
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
        url: "../Data/User/" + field,
        success: function (data) {
            console.log(data);
            convertJsonHighChartsData(data);
        },
        fail: function () {
            console.log("Ajax error");
        }
    });
}

function convertJsonHighChartsData(json)
{
    $.each($.parseJSON(json), function (idx, obj) {
        console.log("idx = " + idx + " obj = " + obj.tag);
    });
}