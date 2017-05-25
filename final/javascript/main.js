const BASE_URL = window.location.origin + '/~lbaw1651/final/';

const upvoteUrl = `${BASE_URL}api/posts/upvote.php`;
const downvoteUrl = `${BASE_URL}api/posts/downvote.php`;
const getSearchUrl = `${BASE_URL}api/posts/search.php`;

tinymce.init({
    selector: '#post-editor'
});