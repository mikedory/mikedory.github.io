(function() {
  var boop;
  boop = 'boop';
  if (console) {
    console.log(boop);
  } else {
    alert(boop);
  }
}).call(this);
