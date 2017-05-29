
function hideReport(id){
	$('input[value=' + id + ']').parent().parent().hide();
}

function deleteAjax(id){
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

function deleteRequest(){
	var id = $(this).next().next().next().val();
	deleteAjax(id);
}

function deletePost(){
	var id = $(this).next().next().next().val();
	$.get(deletePostUrl,
	{
		'id' : id,
	},
	function(data, status){
		if(status === 'success'){
			deleteAjax(id);
		}
	}).fail(function() {
		//
	});
}

function banUser(){
	var test = $(this);
	var id = $(this).next().next().next().val();
	var username = $(this).next().next().next().next().val();
	$.get(banUserUrl,
	{
		'id' : id,
		'user' : username
	},
	function(data, status){
		if(status === 'success'){
			test.hide();
		}
	}).fail(function() {
		//
	});
}

function loadDocument(){
	$('.report-section button[name=dismiss]').click(deleteRequest);
	$('.report-section button[name=deletePost]').click(deletePost);
	$('.report-section button[name=banUser]').click(banUser);
}

$(document).ready(loadDocument);