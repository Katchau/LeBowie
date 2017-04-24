const BASE_URL = window.location.origin + '/~lbaw1651/proto/';

$(function() {
    let questionId = $('#question-id').val('value');
    console.log("QUESTIONID="+questionId);
    $('#upvote-btn').click(function() {
        $.post(`${BASE_URL}api/questions/upvote.php`, { id: questionId });    
    });
    $('#downvote-btn').click(function() {
        $.post(`${BASE_URL}api/questions/downvote.php`, { id: questionId });
    });
});