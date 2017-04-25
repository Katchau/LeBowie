function upvotePost(postId) {
    $.post(upvoteUrl,
    {
        'id': postId
    },
    function(data, status, xhr) {
        if (status === 'success') {
            let el = $(`#js-upvote-btn-${postId} span`);
            let upvotes = parseInt(el.text());
            el.text(upvotes + 1);
            if (xhr.status === 200) {
                el = $(`#js-downvote-btn-${postId} span`);
                let downvotes = parseInt(el.text());
                el.text(downvotes - 1);
            }
        }
    });
}

function downvotePost(postId) {
    $.post(upvoteUrl,
    {
        'id': postOd
    },
    function(data, status, xhr) {
        if (status === 'success') {
            let el = $(`js-downvote-btn-${postId} span`);
            let downvotes = parseInt(el.text());
            el.text(downvotes + 1);
            if (xhr.status === 200) {
                el = $(`#js-upvote-btn-${postId} span`);
                let upvotes = parseInt(el.text());
                el.text(upvotes - 1);
            }
        }
    });
}