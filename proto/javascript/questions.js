$(function() {
    $('#upvote-btn').click(upvoteQuestion);
    $('#downvote-btn').click(downvoteQuestion);
});

function upvoteQuestion(questionId) {
    $.post('api/questions/upvote.php', { id: questionId });
}

function downvoteQuestion(questionId) {
    $.post('api/questions/downvote.php', { id: questionId });
}