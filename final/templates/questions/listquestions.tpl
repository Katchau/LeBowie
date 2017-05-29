 {if $questions|@count == 0}
<div class="none_found jumbotron">
	No questions.
</div>
{/if} {if type == 2} {foreach $questions as $question}

<li>
	<a class="list-group-item suggestion" href="{$BASE_URL}pages/questions/index.php?id={$question.post_id}">{$question.title}
		<span class="badge">
			{$question.up_score}
		</span>
	</a>
</li>

{/foreach} {else} 

{foreach $questions as $question}
<div class="question well">
	<h2 class="questionTitle"><a href="{$BASE_URL}pages/questions/index.php?id={$question.post_id}">{$question.title}</a></h2>
	<div class="questionInfo">
		asked by
		<!-- <a id={$question.creation} href="{$BASE_URL}pages/users/index.php?username={$question.username}" class="writer">{$question.username}</a>		on {$question.creation} {if $type != 1} in <a id={$question.id} class="topic" href="{$BASE_URL}pages/topic/list.php?id={$question.id}"> {$question.topicname} </a>		{/if} {if $type != 0} NEW FROM HERE{/if}-->
		<a href="{$BASE_URL}pages/users/index.php?username={$question.username|escape:'url'}" class="writer">{$question.username}</a>		on {$question.creation} {if $type != 1} in <a class="topic" href="{$BASE_URL}pages/topic/list.php?id={$question.id}">{$question.topicname}</a>		{/if} {if $type != 0 && $type != 2}
		<button type="button" class="btn btn-default" {if !$USERNAME} disabled{/if}>
			<!-- <span id={$question.up_score} class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> {$question.up_score} </span> -->
			<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> {$question.up_score} </span>
		</button>
		<button type="button" class="btn btn-default" {if !$USERNAME} disabled{/if}>
			<!-- <span id={$question.down_score} class="glyphicon glyphicon-thumbs-down" aria-hidden="true"> {$question.down_score} </span> -->
			<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"> {$question.down_score} </span>
		</button> {/if}
		<input type="hidden" name="creation" value={$question.creation}>
		<input type="hidden" name="upscore" value={$question.up_score}>
		<input type="hidden" name="downscore" value={$question.down_score}>
		<input type="hidden" name="topic" value={$question.id}>

	</div>
	{if $type != 2}
	<div class="postBody">
		{$question.description|unescape:'html'}
		<hr>
		<div class="bestanswer">
			{if isset($question.answer)}
			<span class="top-answer">Accepted Answer</span> {$question.answer_desc|unescape:'html'}
			<p class="writerInfo">
				answered by <a href="#" class="writer"> {$question.answer_user_name} </a> on {$question.answer_creation}
			</p>
			{else}
			<p>
				There hasn't been an accepted answer to this question!
			</p>
			{/if}
			<a aria-hidden="true" href="{$BASE_URL}pages/questions/answer.php?id={$question.post_id}" class="btn btn-default"> Add an Answer </a>
		</div>
	</div>
	{/if}
</div>

{/foreach} {/if}