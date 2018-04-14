function makeCal() {
  $('#calendar').fullCalendar({
    // put your options and callbacks here
    googleCalendarApiKey: 'AIzaSyCfZySfNEXpxhXo9YCnRaPVOB0PyqEvv5Q',
    eventSources: [
     {
       googleCalendarId: 'rsb5dm3du0g4u99ghf04m4dud4@group.calendar.google.com',
       color: '#1c3440'
     },

   ],

    height: 650,
    selectable: true,
    selectHelper: true,
    editable: true,
    minTime: "07:00:00",
    defaultView: 'agendaWeek',
    eventLimit: true,
    header: {
      left:   'title',
      center: '',
      right:  'today prev,next, agendaWeek, month'
    },


  select: function(start, end) {
    $.getScript('/events/new', function() {
      console.log(start);
      $('#start_date').val(moment(start).format("YYYY-MM-DD HH:mm"));
      $('#end_date').val(moment(end).format("YYYY-MM-DD HH:mm"));

      console.log($('#start_date'))


    })
  },

  eventClick: function(event, element) {
    element.preventDefault();
    var id = event.id;
    var gID = event.source.googleCalendarId.split('@');
    gID = gID[0]
    $.getScript('/events/'+id+'/'+gID, function() {
    })
  }


})

}
