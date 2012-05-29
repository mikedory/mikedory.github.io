
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
    $('.post-group').hide();
    $(div).closest('ul').each(function(index, element) {
      $(element).find('li').removeClass('active');
      return $(element).find('li a').addClass('clickable');
    });
    $(div).closest('li').addClass('active');
    $(div).closest('li a').removeClass('clickable');
    if ($(div).closest('li').hasClass('all')) {
      return $('.post-group').fadeIn(150);
    } else {
      return $('.' + classToShow).fadeIn(150);
    }
  };

  $('li:first a').removeClass('clickable');

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
