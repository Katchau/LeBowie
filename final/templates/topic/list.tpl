{include file='common/header.tpl'}

<div class="container" id="topicBody">

	<div class="row">

		<div class="extras hidden-xs col-sm-4 col-lg-push-8 col-md-push-8 col-sm-push-8">
			{if !isset($topic) || $topic == NULL} {else}
			<label class="tools_label topicTitle"> {$topic.topicname} </label>
			<hr>
			<div class="guidelines_side">
				<h4>About {$topic.topicname}</h4>
				<p class="topicInfo">{$topic.description}</p>
				<a href="{$BASE_URL}pages/questions/ask.php" class="btn btn-default askButton">ask a question</a>
			</div>
			{if $ADMINISTRATOR || $TOPICMODERATOR}
			<hr>
			<br>
			<div class="guidelines_side mod_tools">
				<h3>Moderation</h3>
				<hr>
				{if $ADMINISTRATOR}
				<h5>Moderators:</h5>
				<div class="list-group">
					{foreach $topicMods as $mod}
					<form enctype="multipart/form-data" action="{$BASE_URL}actions/topics/removemod.php" method="post">
					<li class="list-group-item">
						<a href="{$BASE_URL}pages/users/index.php?username={$mod.username}">{$mod.username}</a>
						<a role="button" type="submit" class="badge btn-danger" href="#"><span class="glyphicon glyphicon-remove"></span></a>
					</li>
					<input type="hidden" name="id" value="{$topicId}">
					</form>
					{/foreach}
					<form enctype="multipart/form-data" action="{$BASE_URL}actions/topics/addmod.php" method="post">
					<li class="list-group-item list-group-item-warning">Add a moderator
						<a role="button" type="submit" class="badge btn-success" href="#"><span class="glyphicon glyphicon-plus"></span></a>
						<br>
						<br>
						<input name="mod_to_add" class="form-group-item">
					</li>
					<input type="hidden" name="id" value="{$topicId}">
					</form>
				</div>
				{/if}
				<a href="{$BASE_URL}pages/topic/edit.php?id={$topicId}" class="btn btn-default askButton">edit topic</a> 
			</div>
			{/if}
			<hr> {/if}
		</div>
		<div class="ask_area col-sm-8 col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
			<h1 class="hidden-lg hidden-md hidden-sm topicTitle">{$topic.topicname}</h1>
			<p class="hidden-lg hidden-md hidden-sm">{$topic.description}</p>
			<div id="topic-questions">
				{if !isset($topic) || $topic == NULL}
				<h3>No such topic was found!</h3>
				{else} 
				{include file='questions/listquestions.tpl' questions=$questions type=1} 
				<button class="btn btn-default" id="view-more" onclick="getMoreHotQuestions({$topicId})">View more</button> 
				{/if}
			</div>
		</div>
	</div>
</div>

{include file='common/footer.tpl'}