 {if $reports|@count == 0}
<div class="none_found jumbotron">
	No Reports available.
</div>
{/if} {foreach $reports as $report}

<div class="lelel well">
	<h2 class="questionTitle"><h3">{$report.title}</a> </h3>
	<p class="questionInfo">
		reported by <a id={$report.creation} href="{$BASE_URL}pages/users/index.php?username={$report.username}" class="writer">{$report.username}</a> on {$report.creation}
	</p>
	<div class="postBody">
		Description of report:
		{include file='common/shrinkcontent.tpl' description=$report.content|unescape:'html'}
		<hr>
		Content of the reported post:
		<div class="bestanswer">
			{include file='common/shrinkcontent.tpl' description=$report.description|unescape:'html'}
		</div>
	</div>
</div>

{/foreach}