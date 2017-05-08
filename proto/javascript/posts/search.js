//filter vars
//the month function requires to add 1 (Jan = 0)
var tags = [];
var topicId = 0;
var userNames = [];
var minDate = null;
var maxDate = null;
var byRecent = true;
var byBest = false;
var minScore = null;
var maxScore = null;

function displayQuestions(questions){
	var baseDir = '.searchResults .questionSearch';
	$(baseDir).empty();
	$(baseDir).append(questions);
}

function getQuestions(search){
	$.get(getSearchUrl,
	{
		title : search
	},
	function(data, status){
		//TODO tratar da mensagem de erro?
		if(status === 'success'){
			displayQuestions(data);
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

function updateTags(){
	var textS = $('.advanced_tags_search textarea').val();
	tags = textS.split(',');
}

function updateOrderDate(){
	byRecent = $(this).text() == "newest";
}

function updateDateGap(){
	minDate = $('.advanced_date_limits input[type=date]').first().val();
	maxDate = $('.advanced_date_limits input[type=date]').last().val();
}

function updateFilters(event){
	updateTags();
	updateUsers();
	updateDateGap();
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
	$('.advanced_date_search  ul a').click(updateOrderDate);
	$('.apply_filters_btn').click(updateFilters);
}

$(document).ready(loadDocument);