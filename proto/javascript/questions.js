const BASE_URL = window.location.origin + '/~lbaw1651/proto/';

$(function() {
    let questionId = $('#question-id').val();
    $('#upvote-btn').click(function() {
        $.post(`${BASE_URL}api/questions/upvote.php`, 
        { 
            'id': questionId 
        }, function(data, status) {
            console.log(status);
            if (status == 200) {
                $('#upvote-btn span').val(parseInt(questionId) + 1);
            }
        });    
    });
    $('#downvote-btn').click(function() {
        $.post(`${BASE_URL}api/questions/downvote.php`, { 'id': questionId });
    });
});