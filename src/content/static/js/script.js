
/*
Portfolio page
*/

(function() {
  var hideAndShow, log;

  $(".project-sort-buttons li a.clickable").click(function() {
    if ($(this).closest('li a').hasClass('clickable')) {
      hideAndShow(this);
    } else {

    }
    return false;
  });

  hideAndShow = function(div) {
    var classToShow,
      _this = this;
    classToShow = $(div).closest('li').attr('class').split(' ')[0];
    $('.post-group').fadeOut();
    $(div).closest('ul').each(function(index, element) {
      $(element).find('li').removeClass('active');
      return $(element).find('li a').addClass('clickable');
    });
    $(div).closest('li').addClass('active');
    $(div).closest('li a').removeClass('clickable');
    return $('.' + classToShow).delay(200).fadeIn(150);
  };

  $('li.writing a').removeClass('clickable');

  /*
  Helper functions
  */

  log = function(msg) {
    if (console) {
      return console.log(msg);
    } else {

    }
  };

}).call(this);
