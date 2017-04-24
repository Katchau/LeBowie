$(function() {
    $('#upvote-btn').on('click', upvoteQuestion);
    $('#downvote-btn').on('click', downvoteQuestion);
});

function upvoteQuestion(questionId) {
    $.post('api/questions/upvote.php', { id: questionId });
}

function downvoteQuestion(questionId) {
    $.post('api/questions/downvote.php', { id: questionId });
}