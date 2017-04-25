const BASE_URL = window.location.origin + '/~lbaw1651/proto/';
const url = `${BASE_URL}api/posts/upvote.php`;
let firstVote = true;

$(function () {
    firstVote = true;
    // $('#js-upvote-btn').click(upvoteQuestion);
    // $('#js-downvote-btn').click(downvoteQuestion);
});

function upvoteQuestion() {
    $.post(url,
    {
        'id': $('#js-question-id').val()
    },
    function (data, status) {
        if (status == 'success') {
            let upvotebtn = $('#js-upvote-btn span');
            let upvotes = parseInt(upvotebtn.text());
            upvotebtn.text(upvotes + 1);
            if (!firstVote) {
                let downvotebtn = $('#js-downvote-btn span');
                let downvotes = parseInt(downvotebtn.text());
                downvotebtn.text(downvotes - 1);
            }
            firstVote = false;
        }
    });
}

function downvoteQuestion() {
    $.post(url,
    {
        id: $('#js-question-id').val()
    },
    function (data, status) {
        if (status == 'success') {
            let downvotebtn = $('#js-downvote-btn span');
            let downvotes = parseInt(downvotebtn.text());
            downvotebtn.text(downvotes + 1);
            if (!firstVote) {
                let upvotebtn = $('#js-upvote-btn span');
                let upvotes = parseInt(upvotebtn.text());
                upvotebtn.text(upvotes - 1);
            }
            firstVote = false;
        }
    });
}