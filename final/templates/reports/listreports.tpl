 {if $reports|@count == 0}
<div class="none_found jumbotron">
	No Reports available.
</div>
{/if} {foreach $reports as $report}

<div class="lelel well">
	<h2 class="questionTitle"><h3 class="orange">Report created on {$report.creation} </h3>
	<p class="questionInfo">
		reported user: <a id={$report.creation} class="answer_author" href="{$BASE_URL}pages/users/index.php?username={$report.username}">{$report.username}</a>
	</p>
	<div class="postBody">
		Description of report:
		{include file='common/shrinkcontent.tpl' description=$report.reason|unescape:'html'}
		<hr>
		Content of the reported post:
		<div class="bestanswer">
			{include file='common/shrinkcontent.tpl' description=$report.description|unescape:'html'}
		</div>
	</div>
	<div class="question_votes">
		<button name="dismiss" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
		</button>
		<button name="deletePost" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
		</button>
		<button name="banUser" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>
		</button>
		<input type="hidden" name="id" value={$report.id}>
		<input type="hidden" name="post_id" value={$report.post_id}>
	</div>
</div>

{/foreach}