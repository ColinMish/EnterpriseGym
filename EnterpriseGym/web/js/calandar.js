/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    $(document).ready(function ()
    {
        renderCalendar();
        function renderCalendar()
        {
            $('#calendarMain').fullCalendar({
                eventClick: function (calEvent) {
                    window.location = "Events/Event/" + calEvent.id;
                }, header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                titleRangeSeparator: ' \u2014 ',
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                events: 'Events/All',
                textColor: 'black'
            });
        }
    });

