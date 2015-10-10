// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function(window,undefined){
  "use strict";

  // Sale countdown
  if( $("#countdown_alert").length > 0 ){
    var endtime = new Date( $('#countdown_text').data('endtime') ),
        timerId = countdown(
          function(ts) {
            var new_time_left = ts.toHTML('strong');
            if( new_time_left === '' ){
              // Timer has run out.
              window.location.reload();
            } else {
              document.getElementById('countdown_text').innerHTML = new_time_left;
            }
          },
          endtime,
          countdown.DAYS|countdown.HOURS|countdown.MINUTES);
    $('#countdown_alert').show();
  }

})(window);
