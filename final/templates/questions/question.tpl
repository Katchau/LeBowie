{include file='common/header.tpl'}

{if $question.current_state != 'Deleted'}
<div id="extras-side-nav" class="side-nav">
	<div class="side-nav-options">
		<a href="#">answer question</a>
		{if $ADMINISTRATOR || $TOPICMODERATOR}
		<button name="deletePost" type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
		</button>
		<input type="hidden" name="id" value={$question.id_post}>
		{/if}
	</div>
	<hr>
	<div class="side-nav-options">
		<a href="#">ask</a>
	</div>
	<hr>
	<div class="side-nav-suggested">
		<label>suggested questions</label>
	</div>
</div>

<div class="container">
	{if !isset($question) || $question == NULL}
	<h3>No such question found! It probably was deleted or the link is dead.</h3>
	{else}
	<div class="row">
		<div class="extras hidden-xs col-sm-4 col-lg-push-8 col-md-push-8 col-sm-push-8">
			<label class="tools_label"> tools <span class="glyphicon glyphicon-wrench"></span></label>
			<hr>
			<div class="extras_tools">
				<a aria-hidden="true" href="{$BASE_URL}pages/questions/answer.php?id={$question.post_id}" class="btn btn-default"> answer</a>
			</div>
				{if $USERID == $question.user_id || $ADMINISTRATOR}
					<a aria-hidden="true" href="{$BASE_URL}pages/questions/edit.php?id={$question.post_id}" class="btn btn-default">edit</a>
				 {/if}
			<hr>
			<div class="extras_suggested">
				<label class="related_label"> related questions </label>
				<ul class="list-group suggested_questions">
					{include file='questions/listquestions.tpl' questions=$relquestions type=2}
				</ul>
			</div>
			<hr>
		</div>

		<div class="col-sm-8 question_area col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
			<div class="question">
				<div class="media">
					<div class="media-left">
						<a href="{$BASE_URL}pages/users/index.php?username={$question.username}">
							{if $question.image == NULL}
							<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image"> 
							{else}
							<img class="hidden-xs media-object user_profile_pic" src="{$BASE_URL}images/users/{$question.user_id}/{$question.image}" alt="user_image">
							{/if}
						</a>
					</div>
					<div class="media-body question_area">
						<h3 class="media-heading">
							{$question.title}
						</h3>
						<div class="question_details"> asked by
							<a class="question_author" href="{$BASE_URL}pages/users/index.php?username={$question.username}">{$question.username}</a>							on <span class="question_date">{$question.creation}</span> in <a class="question_topic" href="{$BASE_URL}pages/topic/list.php?id={$question.id}">{$question.topicname}</a>
						</div>
						<hr>
						<div class="question_body">
							{$question.description|unescape:'html'}
						</div>
						<div class="question_coda">
							<div class="question_tags">
								{foreach $tags as $tag}
								{if $tag != ""}
								<a class="label label-default" href="#">{$tag}</a> 
								{/if}
								{/foreach}
							</div>
							<div class="question_votes">
								{if isset($USERID)}
								<label> Was this question relevant? Please leave a vote! </label>
								<input type="hidden" value="{$question.post_id}">
								<a class="btn btn-default" href="{$BASE_URL}pages/reports/report.php?id={$question.post_id}&question={$question.post_id}">
									<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
								</a>
								<button onclick="upvotePost({$question.post_id})" id="js-upvote-btn-{$question.post_id}" type="button" class="btn btn-default"
								 {if !$USERNAME} disabled{/if}>
									<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">{$question.up_score}</span>
								</button>
								<button onclick="downvotePost({$question.post_id})" id="js-downvote-btn-{$question.post_id}" type="button" class="btn btn-default"
								 {if !$USERNAME} disabled{/if}>
									<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">{$question.down_score}</span>
								</button> {/if}
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>

		<div class="col-lg-8 answers">

			<div class="answers_header">
				Answers <span class="answer_no">{sizeof($answers)}</span>
			</div>

			{foreach $answers as $answer} {include file='answers/list.tpl' answer=$answer} {/foreach}
		</div>
	</div>
	{/if}
</div>
{else}
<div class="container">
	<h3>No such question found! It probably was deleted!</h3>
</div>
{/if}

<script src="{$BASE_URL}javascript/posts/posts.js"></script>
<script src="{$BASE_URL}javascript/posts/comments.js"></script>
<script src="{$BASE_URL}javascript/users/reports.js"></script>

{include file='common/footer.tpl'}