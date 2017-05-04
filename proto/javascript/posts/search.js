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

function updateTopic(event){
	console.log('olá');
}

function loadDocument(){
	$('.navbar .collapse .navbar-form .input-group input[type=text]').keypress(searchText);
	$('.advanced_topic_search ul a').click(updateTopic);
}

$(document).ready(loadDocument);