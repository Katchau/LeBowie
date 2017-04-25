function upvoteQuestion(questionId) {
    $.post(upvoteUrl,
    {
        'id': questionId
    },
    function (data, status, xhr) {
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
            console.log("STATUS = " + xhr.status);
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