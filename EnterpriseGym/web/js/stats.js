/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function ()
{
    $("#postData").hide();
    $('.display').DataTable({"scrollX": true});
    var currentUserFilter = "";
    loadColumns("user");
    loadColumns("event");
    var empty = [];
    var users = ["users", 100];
    empty.push(users);
    userpie("Total site users", "Users", empty);
    eventpie("Total site events", "Events", empty);
    loadEventuserbar();

    //eventHandlers
    $("#userproperty").change(function (e) {
        getUsersBy(e.target.options[e.target.selectedIndex].text);
    });

    $("#eventproperty").change(function (e) {
        getEventsBy(e.target.options[e.target.selectedIndex].text);
    });

    $("#userbarproperty").change(function (e) {
        loadValues(e.target.options[e.target.selectedIndex].text);
        currentUserFilter = e.target.options[e.target.selectedIndex].text;
    });

    $("#valuebarproperty").change(function (e) {
        if (currentUserFilter !== "" && e.target.options[e.target.selectedIndex].text !== "")
        {
            filterBarChartBy(currentUserFilter, e.target.options[e.target.selectedIndex].text);
        }
    });

    $('input[type="radio"]').click(function () {
        if ($(this).is(':checked'))
        {          
            $("#postData").val($(this).val());
        }
    });
});

function loadColumns(tableName)
{
    $.ajax({
        type: "GET",
        url: "Stats/" + tableName,
        success: function (data) {
            console.log("LoadColumns= " + data);
            $.each($.parseJSON(data), function (idx, obj) {
                $("#" + tableName + "property").append(new Option(obj, obj));
                if (tableName === "user")
                {
                    $("#" + tableName + "barproperty").append(new Option(obj, obj));
                }
            });
        },
        fail: function () {
            console.log("Ajax error");
        }
    });
}

function loadValues(field)
{
    $.ajax({
        type: "GET",
        url: "Stats/" + field,
        success: function (data) {
            console.log("loadValues = " + data);
            $('#valuebarproperty').empty();
            $("#valuebarproperty").append(new Option("", ""));
            $.each($.parseJSON(data), function (idx, obj) {
                $("#valuebarproperty").append(new Option(obj, obj));
            });
        },
        fail: function () {
            console.log("Ajax error");
        }
    });
}

function loadEventuserbar()
{
    var jsonData = null;
    var events = [];
    $.ajax({
        type: "GET",
        url: "UserEvent/None/None",
        success: function (data) {
            console.log("loadEventuserbar=" + data);
            $.each($.parseJSON(data), function (idx, obj) {
                events.push(obj.name);
            });
            jsonData = formatBarChartData(data);
            eventuserbar("Events by Attendance", events, jsonData[0], jsonData[1]);
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
            console.log("getUsersBy = " + data);
            var json = formatData(data);
            userpie("Users by " + field, field, json);
        },
        fail: function () {
            console.log("Ajax error");
        }
    });
}

function getEventsBy(field)
{
    $.ajax({
        type: "GET",
        url: "Data/event/" + field,
        success: function (data) {
            console.log(data);
            var json = formatData(data);
            eventpie("Events by " + field, field, json);
        },
        fail: function () {
            console.log("Ajax error");
        }
    });
}

function filterBarChartBy(field, value)
{
    var jsonData = null;
    var events = [];
    $.ajax({
        type: "GET",
        url: "UserEvent/" + field + "/" + value,
        success: function (data) {
            console.log(data);
            $.each($.parseJSON(data), function (idx, obj) {
                events.push(obj.name);
            });
            jsonData = formatBarChartData(data);
            eventuserbar("Events by Attendance filtered by " + field + " = " + value, events, jsonData[0], jsonData[1]);
        },
        fail: function () {
            console.log("Ajax error");
        }
    });
}

function formatData(data)
{
    var json = [];
    var item = [];
    var value = [];
    $.each($.parseJSON(data), function (idx, obj) {
        item.push(obj.name);
        value.push(obj.y);
    });

    for (var i = 0; i < item.length; i++)
    {
        var percent = ((item.length / value[i]) * 100);
        var newItem = [item[i], percent];
        json.push(newItem);
    }
    return json;
}

function formatBarChartData(data)
{
    var json = [];
    var attended = [];
    var abcsent = [];
    $.each($.parseJSON(data), function (idx, obj) {
        attended.push(obj.y);
        abcsent.push(obj.z);
    });
    json.push(attended, abcsent);
    return json;
}