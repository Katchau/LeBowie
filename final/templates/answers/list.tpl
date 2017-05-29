<div class="answer">
	<div class="media">

		<div class="media-left">
			<a href="{$BASE_URL}pages/users/index.php?username={$answer.username}">
				{if $answer.image == NULL}
				<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image"> 
				{else}
				<img class="hidden-xs media-object user_profile_pic" src="{$BASE_URL}images/users/{$answer.user_id}/{$answer.image}" alt="user_image">
				{/if}
			</a>
		</div>

		<div class="media-body answer_area">
			<div class="answer_body">
				{$answer.description|unescape:'html'}
			</div>

			<div class="answer_details"> answered by
				<a class="answer_author" href="{$BASE_URL}pages/users/index.php?username={$answer.username}">{$answer.username}</a>
				on
				<span class="answer_date">{$answer.creation}</span>
			</div>

			<div class="answer_votes">
				{if $answer.accepted == true}
				<a class="badge" href="#"><span class="glyphicon glyphicon-ok"></span></a>
				{/if}

				{if ($USERNAME == $question.username)}
				<a aria-hidden="true" href="{$BASE_URL}api/answers/accept.php?id={$answer.answer}" class="btn btn-default accept_btn"> accept this answer</a>
				{/if}
				
				{if isset($USERID)}
				<a aria-hidden="true" href="{$BASE_URL}pages/answers/comment.php?id={$answer.answer}" class="btn btn-default comment_btn"> comment</a>
				<a class="btn btn-default" href="{$BASE_URL}/pages/reports/report.php?id={$answer.answer}&question={$question.post_id}">
					<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
				</a>
				<button onclick="upvotePost({$answer.answer})" id="js-upvote-btn-{$answer.answer}" type="button" class="btn btn-default" {if ($USERNAME == $answer.username)} disabled {/if}>
					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">{$answer.up_score}</span>
				</button>
				<button onclick="downvotePost({$answer.answer})" id="js-downvote-btn-{$answer.answer}" type="button" class="btn btn-default" {if ($USERNAME == $answer.username)} disabled {/if}>
					<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">{$answer.down_score}</span>
				</button>
				{/if}
			</div>


			<div class="comments">
				<input type="hidden" name="answerId" value={$answer.answer}>
				<a href="#" class="orange">View comments for this answer</a>
				<div>
				</div>
			</div>
			
			<hr>
			<br>
		</div>
	</div>
</div>
