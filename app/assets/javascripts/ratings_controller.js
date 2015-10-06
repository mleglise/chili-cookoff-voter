// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function(window,undefined){
  "use strict";

  if( $('.rateit').length > 0 ){
    $('.rateit').bind('rated reset', function(e) {
      // When a rating is set or cleared.
      var $this    = $(this),
          entry_id = $this.data('entryid'),
          score    = $this.rateit('value');

      // Check for zero value and set it to null.
      if( score == 0){ score = null; }

      // console.log('CHANGED! Entry: %o   Score: %o', entry_id, score);

      $.ajax({
        url: '/ratings.json',
        data: { entry_id: entry_id, score: score },
        dataType: 'text',
        type: 'POST',
        success: function(data){
          // console.log('SUCCESS: %o', data);
          $this.siblings('.rateit-status').
            addClass('text-success').removeClass('text-danger').
            html('<i class="fa fa-check"></i> Saved').
            delay(3000).fadeOut();
        },
        error: function(jxhr, msg, err){
          // console.log('ERROR: %o, %o, %o', jxhr, msg, err);
          $this.siblings('.rateit-status').
            addClass('text-danger').removeClass('text-success').
            html('<i class="fa fa-exclamation-circle"></i> Error: ' + jxhr.responseText).
            show();
        }
      });
    });
  }; // end if

})(window);
