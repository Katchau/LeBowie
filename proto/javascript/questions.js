$(function() {
    $('#upvote-btn').click(function() {
        $.post('api/questions/upvote.php', { id: questionId });    
    });
    $('#downvote-btn').click(downvoteQuestion);
});

function upvoteQuestion(questionId) {
    $.post('api/questions/upvote.php', { id: questionId });
}

function downvoteQuestion(questionId) {
    $.post('api/questions/downvote.php', { id: questionId });
}