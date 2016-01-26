// Search forms for YouTube. There are duplicates to handle issues that may be caused by Turbolinks.

// Link to explanation on Stack Overflow: http://stackoverflow.com/questions/17600093/rails-javascript-not-loading-after-clicking-through-link-to-helper

$(document).on('page:load', function() {
$('#search_form').submit(function(e) {
    e.preventDefault();
    var keyword = $(":input[name=keyword]", this).val();
    searchYouTube(keyword)
});
});

// need both in case the user opens a new tab
$(document).ready(function() {
$('#search_form').submit(function(e) {
    e.preventDefault();
    var keyword = $(":input[name=keyword]", this).val();
    searchYouTube(keyword)
});
});

function searchYouTube(searchTerms) {
  var ajaxArgument = {
      type: 'get',
      url: 'https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&order=relevance&q=' + searchTerms + '&type=video&key= ' + youTubeENV,
      dataType: 'json',
      success: function(data) {
          console.log("success");

// this code fixes the conflict between underscore and ERB
// source: http://stackoverflow.com/questions/14247084/undefined-local-variables-in-templates
        _.templateSettings = {
            interpolate : /\{\{=(.+?)\}\}/g,
            escape : /\{\{-(.+?)\}\}/g,
            evaluate: /\{\{(.+?)\}\}/g,
        };

        var searchTemplate = $('#search_template').html();
        // console.log('Transforming template');
        var compileTpl = _.template(searchTemplate);
        // console.log('Creating HTML from template & model data');
        $('#searchResults').html("");
        for (var i = 0; i < data.items.length; i++) {
              var html = compileTpl(data.items[i]);
              // console.log(data.items[i]);
              // console.log('Rendering to page....');
              $('#searchResults').append(html);
            }
    },
    error: function(error) {
        console.log("error")
        console.log(error);
    }
};
// make the ajax call
  $.ajax(ajaxArgument);
}
