  {if $users|@count == 0}
  	<div class="none_found jumbotron">
			No users found.
	</div>
  {/if}
  
  {foreach $users as $userr}

	<div class="well">
		<h2 class ="writer"><a href="{$BASE_URL}pages/users/index.php?username={$userr.username}">{$userr.username}</a> </h2>
	</div>

  {/foreach}