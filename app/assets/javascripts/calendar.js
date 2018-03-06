$(document).ready(function() {

  // page is now ready, initialize the calendar...

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
     }

   ],

    height: 650,
    selectable: true,
    editable: true,
    header: {
      left:   'title',
      center: '',
      right:  'today prev,next'
    },


    events: [
    {
      title  : 'event1',
      start  : '2010-01-01'
    },
    {
      title  : 'event2',
      start  : '2010-01-05',
      end    : '2010-01-07'
    },
    {
      title  : 'event3',
      start  : '2018-03-03T12:30:00',
      allDay : false // will make the time show
    }
  ],

  // eventClick: function(event, element) {
  //
  //   event.title = "CLICKED!";
  //
  //   $('#calendar').fullCalendar('updateEvent', event);
  //
  // },

  select: function(start, end) {
    $.getScript('/events/new', function() {
      console.log('working');

    })
  },

  eventClick: function(event, element) {
    element.preventDefault();
    source = event.source.googleCalendarId.split("@");
    source = source[0]
    console.log(source)
    eventId = event.id;



    $.getScript(`/events/${eventId}/${source}`, function(response) {
      console.log(response)
    });
  }


})





});
