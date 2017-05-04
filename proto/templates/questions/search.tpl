{include file='common/header.tpl'}
{include file='common/scriptlist.tpl'}


	<div class="container" id="searchBody">
		<div class="row">
	
			<div class="extras hidden-xs col-sm-4 col-md-push-8 col-sm-push-8">
				<label class="tools_label"> advanced search <span class="glyphicon glyphicon-search"></span></label>
				<hr>
				<div class="advanced_search">
				<p>You can apply the following filters to narrow down the results:</p>
				<hr>
				<div class="advanced_topic_search text-left">
					<h3>topic</h3>
					<label class="advanced_search_label">within this topic:</label>
					<div class="input-group dropdown advanced_topic_dropdown pull-right">
					<button class="btn btn-default dropdown-toggle" type="button" id="advanced_topic_search" data-toggle="dropdown">Pick Topic
					<span class="caret"></span></button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="advanced_topic_search">
					{foreach $headerTopics as $headerTopic}
						<li role="presentation">
							<a role="menuitem" href="{$BASE_URL}pages/topic/list.php?id={$headerTopic.id}">
							{$headerTopic.topicname}
							</a>
						</li>
					{/foreach}
					</ul>
					</div>
				</div>
				<div class="advanced_tags_search text-left">
					<h3>tags</h3>
					<label class="advanced_search_label">containing tags:</label>
					<textarea class="form-control pull-right" rows="1" placeholder="enter your tags, separated by commas"></textarea>
				</div>
				<div class="advanced_score_search text-left">
					<h3>score</h3>
					<label class="advanced_search_label">by relevancy:</label>
					<div class="input-group dropdown advanced_topic_dropdown pull-right">
					<button class="btn btn-default dropdown-toggle" type="button" id="advanced_score_search" data-toggle="dropdown">Pick Relevancy
					<span class="caret"></span></button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="advanced_topic_search">
						<li role="presentation"><a role="menuitem" href="#">hottest</a></li>
						<li role="presentation"><a role="menuitem" href="#">controversial</a></li>
						<li role="presentation"><a role="menuitem" href="#">best</a></li>
					</ul>
					</div>
					<br>
					<label class="advanced_search_label">within score:</label>
					<div class="advanced_score_limits">
					<label class="glyphicon glyphicon-thumbs-up"></label>
					<textarea class="form-control" rows="1"></textarea>
					<span>-</span>
					<textarea class="form-control" rows="1"></textarea>
					</div>
					<div class="advanced_score_limits">
					<label class="glyphicon glyphicon-thumbs-down"></label>
					<textarea class="form-control" rows="1"></textarea>
					<span>-</span>
					<textarea class="form-control" rows="1"></textarea>
					</div>
				</div>
				<div class="advanced_user_search text-left">
					<h3>user</h3>
					<label class="advanced_search_label">containing user(s):</label>
					<textarea class="form-control pull-right" rows="1" placeholder="usernames, separated by commas"></textarea>
				</div>
				<div class="advanced_date_search text-left">
					<h3>date</h3>
					<label class="advanced_search_label">by relevancy:</label>
					<div class="input-group dropdown advanced_topic_dropdown pull-right">
					<button class="btn btn-default dropdown-toggle" type="button" id="advanced_date_search" data-toggle="dropdown">Pick Relevancy
					<span class="caret"></span></button>
					<ul class="dropdown-menu" role="menu" aria-labelledby="advanced_topic_search">
						<li role="presentation"><a role="menuitem" href="#">oldest</a></li>
						<li role="presentation"><a role="menuitem" href="#">newest</a></li>
					</ul>
					</div>
					<br>
					<label class="advanced_search_label">within date:</label>
					<div class="advanced_date_limits">
					<input type="date" class="form-control" rows="1"></input>
					<span>-</span>
					<input type="date" class="form-control" rows="1"></input>
					</div>
					<br>
					<center>
					<button class="btn btn-default apply_filters_btn">Apply Filters</button>
					</center>
				</div>
				</div>
			</div>
	
			<div class="col-sm-8 searchResults col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
				<div class="topicSearch">
					<div class="jumbotrona well">
						<center><h3>Showing search Results for '{$string}'</h3></center>
					</div>
				</div>
				<div class="questionSearch">
					{include file='questions/listquestions.tpl' questions=$questions type=0}
				</div>
			</div>
		</div>
	</div>

<script src="{$BASE_URL}javascript/posts/search.js"></script>

{include file='common/footer.tpl'}