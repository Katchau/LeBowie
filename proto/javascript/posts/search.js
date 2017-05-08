//filter vars
//the month function requires to add 1 (Jan = 0)
var tags = [];
var topicId = 0;
var userNames = [];
var minDate = [];
var maxDate = [];
var byRecent = true;
var byBest = false;
var minScore = null;
var maxScore = null;
var needToAjax = false;
var nameToSearch = "";

function displayQuestions(questions){
	var baseDir = '.searchResults .questionSearch';
	$(baseDir).empty();
	$(baseDir).append(questions);
}

function getQuestions(){
	$.get(getSearchUrl,
	{
		'title' : nameToSearch,
		'tags[]' : tags,
		'recent' : byRecent,
		'best' : byBest
	},
	function(data, status){
		//TODO tratar da mensagem de erro?
		if(status === 'success'){
			//displayQuestions(data);
		}
	});
}

function searchText(){
	needToAjax = true;
	if(event.which == 8){
		var textS  = "Showing search Results for '" + $(this).val().substring(0,$(this).val().length-1) + "'";
		$('.searchResults .jumbotrona h3').text(textS);
	}
}

function updateSearch(){
	var textS = $(this).val() + String.fromCharCode(event.which);
	$('.searchResults .jumbotrona h3').text("Showing search Results for '" + textS + "'");
}

function updateQuestionTitle(){
	nameToSearch = $('.navbar .collapse .navbar-form .input-group input[type=text]').val();
}

function updateTopic(){
	topicId = $(this).attr('id');
}

function topicFilter(child){
	if(topicId == 0)return false;
	var topic = child.find('.topic');
	var needsChange = topic.attr('id') != topicId;
	if(needsChange) child.hide(400);
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
	if(needsChange) child.hide(400);
	return needsChange;
}

function updateTags(){
	var textS = $('.advanced_tags_search textarea').val();
	tags = textS.split(',');
	if(needToAjax)return;
	needToAjax = !(tags.length == 1 && tags[0] == "");
}

function updateOrderDate(){
	byRecent = $(this).text() == "newest";
	needToAjax = true;
}

function updateOrderScore(){
	byBest = $(this).is(":checked");
	needToAjax = true;
}

function updateVoteGap(){
	minScore = $('.advanced_score_search textarea').first().val();
	maxScore = $('.advanced_score_search textarea').last().val();
	if(minScore == "") minScore = null;
	if(maxScore == "") maxScore = null;
}

function votesFilter(child){
	if(minScore == null && maxScore == null)return false;//needs show?
	var upVote = child.find('.questionInfo button span').first().attr('id');
	var dowVote = child.find('.questionInfo button span').last().attr('id');
	var vote = upVote - dowVote;
	if((minScore != null && minScore > vote)||(maxScore != null && maxScore < vote)){
		child.hide(400);
		return true;
	}
	return false;
}

function updateDateGap(){
	minDat = $('.advanced_date_limits input[type=date]').first().val();
	maxDat = $('.advanced_date_limits input[type=date]').last().val();
	minDate = minDat.split('-');
	maxDate = maxDat.split('-');
}

function datesFilter(child){
	if(minDate.length != 3 && maxDate.length != 3)return false;//needs show?
	var date = child.find('.questionInfo a').first().attr('id').split('-');
	for(var i = 0; i < date.length; i++){
		if((minDate.length == 3 && minDate[i] > date[i])||
		(maxDate.length == 3 && maxDate[i] < date[i])){
			child.hide(400);
			return true;
		}
		if((minDate.length == 3 && minDate[i] == date[i])||
		(maxDate.length == 3 && maxDate[i] == date[i]))continue;
		else break;
	}
	return false;
}

function updateFilters(){
	updateTags();
	updateUsers();
	updateVoteGap();
	updateDateGap();
	updateQuestionTitle();
	var children = $('.questionSearch').children();
	children.hide(100);//i like the animation xD
	if(needToAjax)getQuestions();
	needToAjax = false;
	for(var i = 0; i < children.length; i++){
		var child = children.eq(i);
		if(topicFilter(child))continue;
		if(usersFilter(child))continue;
		if(votesFilter(child))continue;
		if(datesFilter(child))continue;
		child.show(400);
	}
}

function loadDocument(){
	$('.navbar .collapse .navbar-form .input-group input[type=text]').keydown(searchText);
	$('.navbar .collapse .navbar-form .input-group input[type=text]').keypress(updateSearch);
	$('.advanced_topic_search ul a').click(updateTopic);
	$('.advanced_score_search input[type=checkbox]').click(updateOrderScore);
	$('.advanced_date_search  ul a').click(updateOrderDate);
	$('.apply_filters_btn').click(updateFilters);
}

$(document).ready(loadDocument);