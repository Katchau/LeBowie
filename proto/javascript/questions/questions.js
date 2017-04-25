const BASE_URL = window.location.origin + '/~lbaw1651/proto/';
const upvoteUrl = `${BASE_URL}api/posts/upvote.php`;
const downvoteUrl = `${BASE_URL}api/posts/downvote.php`;
let firstVote = true;

function upvoteQuestion(questionId) {
    $.post(upvoteUrl,
    {
        'id': questionId
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

function downvoteQuestion(questionId) {
    $.post(downvoteUrl,
    {
        'id': questionId
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