function upvotePost(postId) {
    decrementDownvoteCounter(postId);
    $.post(upvoteUrl,
    {
        'id': postId
    },
    function(data, status) {
        if (status === 'success') {
            incrementUpvoteCounter(postId);
        }
    })
    .fail(function() {
        incrementDownvoteCounter(postId);
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
            incrementDownvoteCounter(postId);
        }
    })
    .fail(function() {
        incrementUpvoteCounter(postId);
    });
}

function incrementDownvoteCounter(postId) {
    let el = $(`#js-downvote-btn-${postId} span`);
    let downvotes = parseInt(el.text());
    el.text(downvotes + 1);
}

function incrementUpvoteCounter(postId) {
    let el = $(`#js-upvote-btn-${postId} span`);
    let upvotes = parseInt(el.text());
    el.text(upvotes + 1);
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