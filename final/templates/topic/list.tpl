{include file='common/header.tpl'}
{include file='common/scriptlist.tpl'}

<div class="container" id="topicBody">

   <div class="row">

	<div class="extras hidden-xs col-sm-4 col-lg-push-8 col-md-push-8 col-sm-push-8">
		{if !isset($topic) || $topic == NULL}
		{else}
		<label class="tools_label topicTitle"> {$topic.topicname} </label>
		<hr>
		<div class="guidelines_side">
			<h1>About {$topic.topicname}</h1>
			<p class="topicInfo">{$topic.description}</p>
			<a href="{$BASE_URL}pages/questions/ask.php" class="btn btn-default askButton">ask a question</a>
		</div>
		<div class="mod_tools">
			<h1>Moderation</h1>
			<a href="" class="btn btn-default askButton">edit topic</a>
			<a href="" class="btn btn-default askButton">assign moderators</a>
		</div>
		<hr>
		<hr>
	</div>
	<div class="ask_area col-sm-8 col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
        <h1 class="hidden-lg hidden-md hidden-sm topicTitle">{$topic.topicname}</h1>
	<p class="hidden-lg hidden-md hidden-sm">{$topic.description}</p>
	<div>
	{if !isset($topic) || $topic == NULL}
		<h3>No such topic was found!</h3>
	{else}
	{include file='questions/listquestions.tpl' questions=$questions type=1}
	{/if}
	</div>
	</div>
	</div>
</div>

  {include file='common/footer.tpl'}