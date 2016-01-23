// Search form

$(document).on('page:load', function() {
$('#spotify_search_form').submit(function(e) {
    e.preventDefault();
    var searchTermsTrack = $(":input[name=keyword]", this).val();
    searchSpotify(searchTermsTrack);
});
});
// need both in case they open a new tab
$(document).ready(function() {
$('#spotify_search_form').submit(function(e) {
    e.preventDefault();
    var searchTermsTrack = $(":input[name=keyword]", this).val();
    searchSpotify(searchTermsTrack);
});
});


function searchSpotify(searchTermsTrack) {
var ajaxArgument = {
    type: 'get',
    url: 'https://api.spotify.com/v1/search?q=' + searchTermsTrack + '*&type=track',
    dataType: 'json',
    success: function(data) {
        console.log("success");
        // console.log(data.tracks.items);
        for (var i = 0; i < data.tracks.items.length; i++) {
          // console.log(data.tracks.items[i]);
          // console.log(data.tracks.items[i].album.images[1].url);
        }
        _.templateSettings = {
            interpolate : /\{\{=(.+?)\}\}/g,
            escape : /\{\{-(.+?)\}\}/g,
            evaluate: /\{\{(.+?)\}\}/g,
        };

                  var searchTemplate = $('#spotify_search_template').html();
                  // console.log('Transforming template');
                  var compileTpl = _.template(searchTemplate);
                  // console.log('Creating HTML from template & model data');
                  $('#searchResults').html("");
                  for (var i = 0; i < data.tracks.items.length; i++) {
                        var html = compileTpl(data.tracks.items[i]);
                        // console.log(data.tracks.items[i]);
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
};
