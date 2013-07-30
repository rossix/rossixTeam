$(document).ready ->
  $('#projectcalendar').fullCalendar
    editable: true,
    firstDay: 1,
    header:
      left: 'prev,next today',
      center: 'title',
      right: 'month,basicWeek,basicDay'
    defaultView: 'month',
    monthNames: ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember']

    height: 500,
    slotMinutes: 30,

    eventSources: [{
      url: '/projectevents',
    }],

    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5"

    eventDrop: (projectevent, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(projectevent);

    eventResize: (projectevent, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(projectevent);


updateEvent = (the_event) ->
  $.update "/projectevents/" + the_event.id,
    projectevent:
      title: the_event.title,
      starts_at: "" + the_event.start,
      ends_at: "" + the_event.end,
      description: the_event.description
