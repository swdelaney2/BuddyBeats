// Search form

// $(document).ready(function() {
$(document).on('page:load', function() {
$('#search_form').submit(function(e) {
    e.preventDefault();
    var keyword = $(":input[name=keyword]", this).val();
    searchYouTube(keyword)
});
});


function searchYouTube(searchTerms) {
var ajaxArgument = {
    type: 'get',
    url: 'https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&order=relevance&q=' + searchTerms + '&type=video&key= AIzaSyCKKevlkervBArvX6FKFEbV41FbvmQwHWw',
    dataType: 'json',
    success: function(data) {
        console.log("success");
        // console.log(data);
        // console.log(data.items[0].snippet.title);
        // console.log(data.items[0].snippet.thumbnails.high.url);
        // console.log(data.items[0].id.videoId);


        // $('#searchResults').html("");
        //   for (var i = 0; i < data.items.length; i++) {
        //     $('#searchResults').append("<li><a href=https://youtu.be/" + data.items[i].id.videoId + ">" + data.items[i].snippet.title + "</a></li><p><img src=" + data.items[i].snippet.thumbnails.high.url + ">");
        //           }

// this code fixes the conflict between underscore and ERB
// source: http://stackoverflow.com/questions/14247084/undefined-local-variables-in-templates
        _.templateSettings = {
            interpolate : /\{\{=(.+?)\}\}/g,
            escape : /\{\{-(.+?)\}\}/g,
            evaluate: /\{\{(.+?)\}\}/g,
        };


                  var searchTemplate = $('#search_template').html();
                  console.log('Transforming template');
                  var compileTpl = _.template(searchTemplate);
                  console.log('Creating HTML from template & model data');
                  $('#searchResults').html("");
                  for (var i = 0; i < data.items.length; i++) {
                        var html = compileTpl(data.items[i]);
                        console.log(data.items[i]);
                        console.log('Rendering to page....');
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
