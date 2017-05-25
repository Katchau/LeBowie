
function displayQuestions(questions){
	var baseDir = '.searchResults .questionSearch';
	$(baseDir).empty();
	$(baseDir).append(questions);
}

function getComment(){
	console.log('wtf');
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
			displayQuestions(data);
		}
	});
}

function loadDocument(){
	$('.navbar .collapse .navbar-form .input-group input[type=text]').keydown(searchText);
	$('.navbar .collapse .navbar-form .input-group input[type=text]').keypress(updateSearch);
	$('.advanced_tags_search textarea').keydown(writeTags);
	$('.advanced_topic_search ul a').click(updateTopic);
	$('.advanced_score_search input[type=checkbox]').click(updateOrderScore);
	$('.advanced_date_search  ul a').click(updateOrderDate);
	$('.apply_filters_btn').click(updateFilters);
}

$(document).ready(loadDocument);