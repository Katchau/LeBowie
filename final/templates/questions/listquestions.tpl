
  {if $questions|@count == 0}
  	<div class="jumbotron">
			No questions found at this time.
	</div>
  {/if}
  
  {foreach $questions as $question}

	<div class="question well">
		<h2 class ="questionTitle"><a href="{$BASE_URL}pages/questions/index.php?id={$question.post_id}">{$question.title}</a> </h2>
		<p class="questionInfo">
			asked by <a id={$question.creation} href="{$BASE_URL}pages/users/index.php?username={$question.username}" class="writer">{$question.username}</a> on {$question.creation}
			{if $type != 1}
			in <a id={$question.id} class="topic" href="{$BASE_URL}pages/topic/list.php?id={$question.id}"> {$question.topicname} </a>
			{/if}
			{if $type != 0}
			<button type="button" class="btn btn-default" {if !$USERNAME} disabled{/if}>
				<span id={$question.up_score} class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> {$question.up_score} </span>
			</button>
			<button type="button" class="btn btn-default" {if !$USERNAME} disabled{/if}>
				<span id={$question.down_score} class="glyphicon glyphicon-thumbs-down" aria-hidden="true"> {$question.down_score} </span>
			</button>
			{/if}
		</p>
		<div class="postBody">
			{include file='common/shrinkcontent.tpl' description=$question.description|unescape:'html'}
			<hr>
			<div class="bestanswer">
				{if isset($question.answer)}
				 <span class="top-answer">Accepted Answer</span>
				{include file='common/shrinkcontent.tpl' description=$question.answer_desc|unescape:'html'}
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
	</div>

  {/foreach}
