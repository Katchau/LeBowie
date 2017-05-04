// function updateDownvoteCounter(postId) {
    // $.get(downvoteUrl,
    // {
        // id: postId
    // },
    // function(data, status) {
        // if (status === 'success') {
            // let el = $(`#js-downvote-btn-${postId} span`);
            // el.text(data);
        // }
    // });
// }

function searchText(event){
	console.log(event.type + ": " +  event.which);
	console.log($(this).attr('class'));
}

function loadDocument(){
	$('.navbar .collapse .navbar-form .input-group input[type=text]').keypress(searchText);
}

$(document).ready(loadDocument);