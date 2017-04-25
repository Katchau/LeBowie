const BASE_URL = window.location.origin + '/~lbaw1651/proto/';

$(function() {
    let questionId = $('#question-id').val();
    $('#upvote-btn').click(function() {
        $.post(`${BASE_URL}api/questions/upvote.php`, 
        { 
            'id': questionId 
        }, function(data, status) {
            if (status == 'success') {
                let upvoteElem = $('#upvote-btn span');
                let upvotes = parseInt(upvoteElem.text());
                upvoteElem.text(upvotes + 1);
            }
        });    
    });
    $('#downvote-btn').click(function() {
        $.post(`${BASE_URL}api/questions/downvote.php`, { 'id': questionId });
    });
});