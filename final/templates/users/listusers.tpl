 {if $users|@count == 0}
<div class="none_found jumbotron">
	No users found.
</div>
{/if} {foreach $users as $userr}

<div class="well media">
	<div class="media-left">
		<a href="{$BASE_URL}pages/users/index.php?username={$userr.username}">
				{if $userr.image == NULL}
				<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image"> 
				{else}
				<img class="hidden-xs media-object user_profile_pic" src="{$BASE_URL}images/users/{$userr.id}/{$userr.image}" alt="user_image">
				{/if}
			</a>
	</div>
	<div class="media-body">
		<h4 class="media-heading"><a href="{$BASE_URL}pages/users/index.php?username={$userr.username}">{$userr.username}</a> </h4>
		<span>{$userr.first_name} {$userr.last_name}</span>
	</div>
</div>

{/foreach}