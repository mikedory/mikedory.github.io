
/*
Portfolio page
*/

(function() {
  var colorizeRollover, hideAndShow, log, unColorizeRollover;

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

  $('.bwrollover').hover(function() {
    return colorizeRollover(this);
  }, function() {
    return unColorizeRollover(this);
  });

  colorizeRollover = function(div) {
    $(div).find('img.gray').hide();
    return $(div).find('img.color').show();
  };

  unColorizeRollover = function(div) {
    $(div).find('img.color').hide();
    return $(div).find('img.gray').show();
  };

  /* 
  HEY - i am doing this all wrong.  load both images, hide
  */

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
