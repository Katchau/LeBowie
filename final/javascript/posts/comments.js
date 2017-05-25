var isHidden = true;

function displayComments(comments, id){
	var baseDir = ".comments" + '#' + id + " div";
	$(baseDir).empty();
	$(baseDir).append(comments);
	isHidden = !isHidden;
	$('.comments a#' + id).text('Hide comments for this answer');
}

function hideComments(id){
	var baseDir = ".comments" + '#' + id + " div";
	$(baseDir).empty();
	isHidden = !isHidden;
	$('.comments a#' + id).text('View comments for this answer');
}

function getComment(){
	var id = $(this).attr("id");
	console.log(isHidden);
	if(isHidden){
		$.get(getCommentsUrl,
		{
			'answer' : id,
		},
		function(data, status){
			if(status === 'success'){
				displayComments(data, id);
			}
		});
	}
	else hideComments(id);
}

function loadDocument(){
	$('.comments a').click(getComment);
}

$(document).ready(loadDocument);