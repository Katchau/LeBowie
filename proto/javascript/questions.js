const BASE_URL = window.location.origin + '/~lbaw1651/proto/';

$(function() {
    let questionId = parseInt($('#question-id').val());
    $('#upvote-btn').click(function() {
        $.post(`${BASE_URL}api/questions/upvote.php`, { 'id': 282 }, "json");    
    });
    $('#downvote-btn').click(function() {
        $.post(`${BASE_URL}api/questions/downvote.php`, { id: questionId });
    });
});