// This is a manifest file that'll be compiled into including all the files listed below.
// // Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// // be included in the compiled file accessible from http://example.com/assets/application.js
// // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// // the compiled file.
// //
// //= require jquery.min
// //= require jquery_ujs
// //= require jquery.sparkline.min
$(document).bind("mobileinit", function(){
  $.mobile.linkBindingEnabled = false;
});

$(function() {
  $('.session-sparkline').sparkline('html', {
    type:'bar', barWidth:16, colorMap:["hsl(120,100%,40%)","hsl(113,100%,40%)", "hsl(106,100%,40%)", "hsl(99,100%,40%)", "hsl(92,100%,40%)", "hsl(85,100%,40%)", "hsl(78,100%,40%)", "hsl(71,100%,40%)", "hsl(64,100%,40%)", "hsl(57,100%,40%)", "hsl(50,100%,40%)", "hsl(43,100%,40%)", "hsl(36,100%,40%)", "hsl(29,100%,40%)", "hsl(22,100%,40%)", "hsl(15,100%,40%)", "hsl(8,100%,40%)"]
    });
  });

  $('#mainPage').live('pageshow', function() {
  // Go ahead and draw the now-visible sparkline tags
  $.sparkline_display_visible();
});
