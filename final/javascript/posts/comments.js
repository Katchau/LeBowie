var isHidden = true;

function displayComments(comments, id){
	var baseDir = $(".comments input[value=" + id + "]").next().next();
	baseDir.empty();
	baseDir.append(comments);
	isHidden = !isHidden;
	$(".comments input[value=" + id + "]").next().text('Hide comments for this answer');
}

function hideComments(id){
	var baseDir = baseDir = $(".comments input[value=" + id + "]").next().next();
	baseDir.empty();
	isHidden = !isHidden;
	$(".comments input[value=" + id + "]").next().text('View comments for this answer');
}

function getComment(){
	var id = $(this).prev().val();
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