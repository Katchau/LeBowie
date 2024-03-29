{foreach $comments as $comment}
	<div class="comment">
		<div class="media">
			<div class="comment_body">
				<a href="{$BASE_URL}pages/users/index.php?username={$comment.username}">
					{if $comment.image == NULL}
					<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image"> 
					{else}
					<img class="hidden-xs media-object user_profile_pic" src="{$BASE_URL}images/users/{$comment.user_id}/{$comment.image}" alt="user_image">
					{/if}
				</a>
				<a class="comment_author" href="{$BASE_URL}pages/users/index.php?username={$comment.username}">{$comment.username}:</a>
				{$comment.description|unescape:'html'}
			</div>
			
		</div>
		<button type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
		</button>
	</div>
{/foreach}
