(function() {
  var $, log;

  $ = require('/usr/local/lib/node_modules/jquery');

  log = function(msg) {
    if (console) {
      return console.log(msg);
    } else {

    }
  };

  $(".project-sort-buttons").children().click(function() {
    var classToShow;
    $('.post-group').slideUp();
    classToShow = $(event.target).attr('class').split(' ')[0];
    return $('.' + classToShow).delay(200).slideDown(150);
  });

}).call(this);
