const BASE_URL = window.location.origin + '/~lbaw1651/proto/';

$(function () {
    $('#js-upvote-btn').click(upvoteQuestion);
    $('#js-downvote-btn').click(downvoteQuestion);
});

function upvoteQuestion() {
    $.post(`${BASE_URL}api/questions/upvote.php`,
    {
        'id': $('#js-question-id').val()
    },
    function (data, status) {
        if (status == 'success') {
            let upvotebtn = $('#js-upvote-btn span');
            let upvotes = parseInt(upvotebtn.text());
            upvotebtn.text(upvotes + 1);
        }
    });
}

function downvoteQuestion(questionId) {
    $.post(`${BASE_URL}api/questions/downvote.php`,
    {
        id: $('#js-question-id').val()
    },
    function (data, status) {
        if (status == 'success') {
            let downvotebtn = $('#js-downvote-btn span');
            let downvotes = parseInt(downvotebtn.text());
            downvotebtn.text(upvotes + 1);
        }
    });
}