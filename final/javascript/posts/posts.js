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
            el.text(data);
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
            el.text(data);
        }
    });
}

function acceptAnswer(controller, answerId) {
    console.log($("#accepted-badge").parent().next());
    previousId = $("#accepted-badge").parent().next().find("input[type=hidden][name=answerId]").val();
    if (previousId) {
        $.get(`${BASE_URL}api/answers/unaccept.php?id=${previousId}`, function(data) {
            $("#accepted-badge").remove();
        });
    }

    $.get(`${BASE_URL}api/answers/accept.php?id=${answerId}`, function(data) {
        $(controller).before('<a id="accepted-badge" class="badge" href="#"><span class="glyphicon glyphicon-ok"></span></a>');
    });
}