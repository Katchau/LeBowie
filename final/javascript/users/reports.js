
function hideReport(id){
	$('input[value=' + id + ']').parent().parent().hide();
}


function deleteRequest(){
	var id = $(this).next().next().next().val();
	$.get(deleteReportUrl,
	{
		'id' : id,
	},
	function(data, status){
		if(status === 'success'){
			hideReport(id);
		}
	}).fail(function() {
		
	});
}

function loadDocument(){
	$('.report-section button[name=dismiss]').click(deleteRequest);
}

$(document).ready(loadDocument);