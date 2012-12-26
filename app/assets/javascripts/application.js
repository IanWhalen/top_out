// //= require jquery
// //= require jquery_ujs
// //= require jquery.sparkline.min

$('#mainPage').live('pageshow', function() {
  var colorArr = ["hsl(120,100%,40%)", "hsl(113,100%,40%)", "hsl(106,100%,40%)", "hsl(99,100%,40%)",
	          "hsl(92,100%,40%)", "hsl(85,100%,40%)", "hsl(78,100%,40%)", "hsl(71,100%,40%)",
	          "hsl(64,100%,40%)", "hsl(57,100%,40%)", "hsl(50,100%,40%)", "hsl(43,100%,40%)",
	          "hsl(36,100%,40%)", "hsl(29,100%,40%)", "hsl(22,100%,40%)", "hsl(15,100%,40%)",
	          "hsl(8,100%,40%)"]

  $('.session-sparkline').sparkline('html', {
    type:'bar',
    barWidth:16,
    colorMap:colorArr
    });

  $('.wall-sparkline').sparkline('html', {
    type:'bar',
    barWidth:3,
    colorMap:colorArr
  });
});

$('.wall_problem').live('ajax:success', function(evt, data, status, xhr) {
  if (data.sign_in_needed) {
    $.mobile.changePage(data.sign_in_needed, "slide", false, true);
  } else {
    link_id = 'a#problem_' + data.problem_id;
    $('ul').find(link_id).find('.last_complete').text("Nice job!");
    return false;
  }
});