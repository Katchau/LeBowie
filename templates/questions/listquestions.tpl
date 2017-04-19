{include file='common/header.tpl'}
{include file='common/scriptlist.tpl'}

  {foreach $questions as $question}
		
	<div class="question well">
		<h2 class ="questionTitle"><a href="#">{$question.title}</a> </h2>
		<p class="questionInfo">
			asked by <a href="#" class="writer"> {$question.username} </a> on {$question.creation} 
			{if $type != 1}
			in <a class="topic" href="{$BASE_URL}pages/topic/list.php?id={$question.id}"> {$question.topicname} </a>
			{/if}
			{if $type != 0}
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> {$question.up_score} </span>
			</button>
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"> {$question.down_score} </span>
			</button>
			{/if}
		</p>
		<div class="postBody">
			{include file='common/shrinkcontent.tpl' description=$question.description}
			<hr>
			<div class="bestanswer">
				{if isset($question.answer)}
				 <span class="top-answer">Accepted Answer</span>
				{include file='common/shrinkcontent.tpl' description=$question.answer_desc}
				<p class="writerInfo">
					answered by <a href="#" class="writer"> {$question.answer_user_name} </a> on {$question.answer_creation}
				</p>
				{else}
				<p>
					There hasn't been an accepted answer to this question!
				</p>
				{/if}
				<button type="button" class="btn btn-default">
					<span aria-hidden="true"> Add an Answer </span>
				</button>
			</div>
		</div>
	</div>

  {/foreach}

  {include file='common/footer.tpl'}