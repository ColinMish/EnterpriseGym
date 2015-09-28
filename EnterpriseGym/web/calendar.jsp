<%-- 
    Document   : calendar
    Created on : 28-Sep-2015, 13:30:11
    Author     : Dave
--%>
<script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.4.0/fullcalendar.min.js"></script>
<link rel='stylesheet' href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.4.0/fullcalendar.min.css"/>
<link rel='stylesheet' media="print" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.4.0/fullcalendar.print.css"/>

<script>
    $(document).ready(function ()
    {
        renderCalendar();
        function renderCalendar()
        {
            $('#calendarMain').fullCalendar({
                eventClick: function (calEvent, jsEvent, view) {
                    alert('Event: ' + calEvent.title);
                    alert('id: ' + calEvent.id);
                    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                    alert('View: ' + view.name);
                }, header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                defaultDate: '2015-02-12',
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                events: 'Events/All',
                textColor: 'black'
            });
        }
    });

//    function getEvents()
//    {
//        var data;
//        $.ajax({
//            type: "GET",
//            url: "Events/All",
//            async: false,
//            success: function (returnValue) {
//                data = returnValue;
//            },
//            fail: function () {
//                console.log("Ajax error");
//            }
//        });
//        return data;
//    }
</script>
<div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4><i class="fa fa-fw fa-check"></i>Calendar</h4>
        </div>
        <div class="panel-body">
            <div id="calendarMain"></div>
        </div>
    </div>
</div>

