function makeCal() {
  $('#calendar').fullCalendar({
    // put your options and callbacks here
    googleCalendarApiKey: 'AIzaSyCfZySfNEXpxhXo9YCnRaPVOB0PyqEvv5Q',
    eventSources: [
     {
       googleCalendarId: 'q62u5ipid7kkjallu66mc0gb2k@group.calendar.google.com'
     },
     {
       googleCalendarId: 'k5kihqutjqb1i4v3fdp0tonrh8@group.calendar.google.com',
       className: 'nice-event'
     },
     {
       googleCalendarId: 'm23oi69q8rq7tc1iq3fivpusf8@group.calendar.google.com'
     },
     {
       googleCalendarId: '23d43hdj0qhenfeb81hgf91cn8@group.calendar.google.com'
     },
     {
       googleCalendarId: 'fgi2oho92nq2en5vaprsg272j8@group.calendar.google.com'
     },
     {
       googleCalendarId: 'ttohg6d94hen89q3o6f2290oh4@group.calendar.google.com'
     },
     {
       googleCalendarId: 'jd8satd21hthlnsdp50rl3c2k4@group.calendar.google.com'
     },
     {
       googleCalendarId: 'gh5u69dlkdv6gu72391n3hhb7o@group.calendar.google.com',
       color: 'orange'
     },

   ],

    height: 650,
    selectable: true,
    selectHelper: true,
    editable: true,
    header: {
      left:   'title',
      center: '',
      right:  'today prev,next, agendaWeek, month'
    },


  select: function(start, end) {
    $.getScript('/events/new', function() {
      $('#start_time').val(moment(start).format("YYYY-MM-DD"));
      $('#end_time').val(moment(end).format("YYYY-MM-DD"));
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
