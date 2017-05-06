//finish this crap

var topicId;
var byNew;

function displayQuestions(questions){
	var baseDir = '.searchResults .questionSearch';
	$(baseDir).empty();
	for(var i = 0; i < questions.length; i++){
		var question = questions[i];
		$(baseDir).append('<div class="question well">');
		var qDir = baseDir + ' .question:last-child';
		$(qDir).append('<h2 class = questionTitle>'
		+ '<a href=' + BASE_URL + 'pages/questions/index.php?id='
		+ question['post_id'] + '>' + question['title'] + '</a> </h2>');
	}
}

function getQuestions(search){
	$.get(getSearchUrl,
	{
		title : search
	},
	function(data, status){
		if(status === 'success'){
			var questions = JSON.parse(data);
			displayQuestions(questions);
		}
	});
}

function searchText(event){
	var textS = $(this).val() + String.fromCharCode(event.which);
	$('.searchResults .jumbotrona h3').text("Showing search Results for '" + textS + "'");
	getQuestions(textS);
}

function updateTopic(){
	topicId = $(this).attr('id');
}

function updateFilters(event){
	var children = $('.questionSearch').children();
	if(topicId == 0){
		children.show(400);
		return;
	}
	for(var i = 0; i < children.length; i++){
		var child = children.eq(i);
		var topic = child.find('.topic');
		topic.attr('id') != topicId ? child.hide(400) : child.show(400);
	}
}

function loadDocument(){
	$('.navbar .collapse .navbar-form .input-group input[type=text]').keypress(searchText);
	$('.advanced_topic_search ul a').click(updateTopic);
	$('.apply_filters_btn').click(updateFilters);
}

$(document).ready(loadDocument);