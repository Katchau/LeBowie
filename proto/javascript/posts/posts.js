function upvotePost(postId) {
    $.post(upvoteUrl,
    {
        'id': postId
    },
    function(data, status) {
        if (status === 'success') {
            updateUpvoteCounter(postId);
            updateDownvoteCounter(postId);
        }
    });
}

function downvotePost(postId) {
    $.post(downvoteUrl,
    {
        'id': postId
    },
    function(data, status) {
        if (status === 'success') {
            updateUpvoteCounter(postId);
            updateDownvoteCounter(postId);
        }
    });
}

function updateUpvoteCounter(postId) {
    $.get(upvoteUrl,
    {
        id: postId
    },
    function(data, status) {
        if (status === 'success') {
            let el = $(`#js-upvote-btn-${postId} span`);
            el.text(data.up_score);
        }
    });
}

function updateDownvoteCounter(postId) {
    $.get(downvoteUrl,
    {
        id: postId
    },
    function(data, status) {
        if (status === 'success') {
            let el = $(`#js-downvote-btn-${postId} span`);
            el.text(data.down_score);
        }
    });
}