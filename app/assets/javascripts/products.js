$(document).ready(function(){
  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();

  $.getScript('/products?search=' + searchValue);
  });

 if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination span.next').children().attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 200) {
      	 console.log($('.pagination span.next').children().attr('href'));
        $('.pagination').text("Fetching more products...");
        return $.getScript(url);
      }
    });
  }
});