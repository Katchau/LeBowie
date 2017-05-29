
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

function postAjax(id, reportId){
	$.get(deletePostUrl,
	{
		'id' : id,
	},
	function(data, status){
		if(status === 'success'){
			deleteAjax(reportId);
		}
	}).fail(function() {
		//
	});
}

function deletePost(){
	var id = $(this).next().next().next().val();
	var reportId = $(this).next().next().val();
	postAjax(id, reportId);
}

function banUser(){
	var test = $(this);
	var id = $(this).next().next().next().val();
	var username = $(this).next().next().next().next().val();
	var postId = $(this).next().next().val();
	var reportId = $(this).next().val();
	$.get(banUserUrl,
	{
		'id' : id,
		'user' : username
	},
	function(data, status){
		if(status === 'success'){
			test.hide();
			postAjax(postId, reportId);
		}
	}).fail(function() {
		//
	});
}

function banUser2(){
	var test = $(this);
	var id = $(this).next().val();
	var username = $(this).next().next().val();
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
	$('.ban-user input[name=banUser2]').click(banUser2);
}

$(document).ready(loadDocument);