const BASE_URL = window.location.origin + '/~lbaw1651/final/';

const upvoteUrl = `${BASE_URL}api/posts/upvote.php`;
const downvoteUrl = `${BASE_URL}api/posts/downvote.php`;
const getSearchUrl = `${BASE_URL}api/posts/search.php`;

tinymce.init({
    selector: '#post-editor',
    plugins: [
      'advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker',
      'searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking',
      'save table contextmenu directionality emoticons template paste textcolor'
    ],
});

function hideBanner() {
    document.cookie = "first_visit=false"
}