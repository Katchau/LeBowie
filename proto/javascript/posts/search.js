//filter vars
var topicId = 0;
var userNames = [];
var byNew = true;

//finish this crap
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

function topicFilter(child){
	if(topicId == 0){
		child.show(400);
		return false;
	}
	var topic = child.find('.topic');
	var needsChange = topic.attr('id') != topicId;
	needsChange ? child.hide(400) : child.show(400);
	return needsChange;
}

function updateUsers(){
	var textS = $('.advanced_user_search textarea').val();
	userNames = textS.split(',');
}

function usersFilter(child){
	if(userNames.length == 0) return false;
	if(userNames[0] == "") return false;
	var user = child.find('.questionInfo a.writer').text();
	var needsChange = userNames.indexOf(user) == -1;
	needsChange ? child.hide(400) : child.show(400);
	return needsChange;
}

function updateFilters(event){
	updateUsers();
	var children = $('.questionSearch').children();
	children.hide(100);//i like the animation xD
	for(var i = 0; i < children.length; i++){
		var child = children.eq(i);
		if(topicFilter(child))continue;
		if(usersFilter(child))continue;
	}
}

function loadDocument(){
	$('.navbar .collapse .navbar-form .input-group input[type=text]').keypress(searchText);
	$('.advanced_topic_search ul a').click(updateTopic);
	$('.apply_filters_btn').click(updateFilters);
}

$(document).ready(loadDocument);