  {if $users|@count == 0}
  	<div class="none_found jumbotron">
			No users found.
	</div>
  {/if}
  
  {foreach $users as $userr}

	<div class="well">
			<a href="{$BASE_URL}pages/users/index.php?username={$userr.username}">
				{if $userr.image == NULL}
				<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image"> 
				{else}
				<img class="hidden-xs media-object user_profile_pic" src="{$BASE_URL}images/users/{$userr.id}/{$userr.image}" alt="user_image">
				{/if}
			</a>
			<h3 class ="writer"><a href="{$BASE_URL}pages/users/index.php?username={$userr.username}">{$userr.username}</a> </h3>
			<span class="">{$userr.first_name}." ".{$userr.last_name}</span>
	</div>

  {/foreach}