 {if $reports|@count == 0}
<div class="none_found jumbotron">
	No Reports available.
</div>
{/if} {foreach $reports as $report}

<div class="lelel well">
	<h2 class="questionTitle orange">Report created on {$report.creation} </h2>
	<p class="questionInfo">
		Reported user: <a id={$report.creation} class="answer_author" href="{$BASE_URL}pages/users/index.php?username={$report.username}">{$report.username}</a>
	</p>
	<div class="postBody">
		Reason:
		{$report.reason}
		<hr>
		Content of the reported post:
		<div class="bestanswer">
			{$report.description}
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
		<input type="hidden" name="user_id" value={$report.user_id}>
		<input type="hidden" name="username" value={$report.username}>
	</div>
</div>

{/foreach}