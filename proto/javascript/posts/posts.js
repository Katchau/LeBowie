function upvotePost(postId) {
    decrementDownvoteCounter(postId);
    $.post(upvoteUrl,
    {
        'id': postId
    },
    function(data, status) {
        if (status === 'success') {
            let el = $(`#js-upvote-btn-${postId} span`);
            let upvotes = parseInt(el.text());
            el.text(upvotes + 1);
        }
    });
}

function downvotePost(postId) {
    decrementUpvoteCounter(postId);
    $.post(downvoteUrl,
    {
        'id': postId
    },
    function(data, status) {
        if (status === 'success') {
            let el = $(`#js-downvote-btn-${postId} span`);
            let downvotes = parseInt(el.text());
            el.text(downvotes + 1);
        }
    });
}

function decrementDownvoteCounter(postId) {
    $.get(downvoteUrl,
    {
        'id': postId
    },
    function(data, status) {
        if (status === 'success' && data.downvote) {
            let el = $(`#js-downvote-btn-${postId} span`);
            let downvotes = parseInt(el.text());
            el.text(downvotes - 1);
        }
    });
}

function decrementUpvoteCounter(postId) {
    $.get(upvoteUrl,
    {
        'id': postId
    },
    function(data, status) {
        if (status === 'success' && data.upvote) {
            let el = $(`#js-upvote-btn-${postId} span`);
            let upvotes = parseInt(el.text());
            el.text(upvotes - 1);
        }
    });
}