    <div class="answer">
		<div class="media">
			<div class="media-left">
				<a href="#">
					<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image" height="50px">
				</a>
			</div>
			<div class="media-body answer_area">
				<div class="answer_body">
					{$answer.description|unescape:'html'}
				</div>
				<div class="answer_details"> answered by
					<a class="answer_author" href="#">{$answer.username}</a>
					on
					<span class="answer_date">{$answer.creation}</span>
				</div>
				<div class="answer_votes">
					{if $answer.accepted == true}
					<a class="badge" href="#"><span class="glyphicon glyphicon-ok"></span></a>
					{/if}
                    {if ($USERNAME == $question.username)}
                    <a aria-hidden="true" href="" class="btn btn-default accept_btn"> accept this answer</a>
                    {/if}
                    <a aria-hidden="true" href="{$BASE_URL}pages/answers/comment.php?id={$answer.answer}" class="btn btn-default comment_btn"> comment</a>
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
					</button>
					<button onclick="upvotePost({$answer.answer})" id="js-upvote-btn-{$answer.answer}" type="button" class="btn btn-default" {if !$USERNAME} disabled{/if}>
						<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">{$answer.up_score}</span>
					</button>
					<button onclick="downvotePost({$answer.answer})" id="js-downvote-btn-{$answer.answer}" type="button" class="btn btn-default" {if !$USERNAME} disabled{/if}>
						<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">{$answer.down_score}</span>
					</button>
				</div>

				<hr>

                <div class="comments">
                </div>

				<hr>
			</div>
		</div>
    </div>
