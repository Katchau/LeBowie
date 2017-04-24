const BASE_URL = window.location.origin + window.location.pathname;

$(function() {
    let questionId = $('#question-id').val();
    $('#upvote-btn').click(function() {
        $.post(`${BASE_URL}api/questions/upvote.php`, { id: questionId });    
    });
    $('#downvote-btn').click(downvoteQuestion);
});

function upvoteQuestion(questionId) {
    $.post('api/questions/upvote.php', { id: questionId });
}

function downvoteQuestion(questionId) {
    $.post('api/questions/downvote.php', { id: questionId });
}