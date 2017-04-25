{include file='common/header.tpl'}
{include file='common/scriptlist.tpl'}

<script src="{$BASE_URL}javascript/questions.js"></script>

<div id="extras-side-nav" class="side-nav">
      <div class="side-nav-options">
        <a href="#">answer question</a>
      </div>
      <hr>
      <div class="side-nav-options">
        <a href="#">ask</a>
      </div>
      <hr>
      <div class="side-nav-suggested">
        <label>suggested questions</label>
      </div>
</div>

<div class="container">
	<div class="row">
		<div class="extras hidden-xs col-sm-4 col-lg-push-8 col-md-push-8 col-sm-push-8">
          <label class="tools_label"> tools <span class="glyphicon glyphicon-wrench"></span></label>
          <hr>
          <div class="extras_tools">
             <a aria-hidden="true" href="{$BASE_URL}pages/questions/answer.php?id={$question.post_id}" class="btn btn-default"> answer</a>
             <a aria-hidden="true" href="{$BASE_URL}pages/questions/ask.php" class="btn btn-default"> ask a question</a>
          </div>
          <hr>
          <div class="extras_suggested">
            <label class="related_label"> related questions </label>
            <ul class="list-group" ></ul>
          </div>
          <hr>
        </div>

		<div class="col-sm-8 question_area col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
			<div class="question">
				<div class="media">
					<div class="media-left">
						<a href="#">
							<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image">
						</a>
					</div>
					<div class="media-body question_area">
						<h3 class="media-heading">
							{$question.title}
						</h3>
						<div class="question_details"> asked by
							<a class="question_author" href="{$BASE_URL}pages/users/index.php?username={$question.username}">{$question.username}</a> on <span class="question_date">{$question.creation}</span> in <a class="question_topic" href="{$BASE_URL}pages/topic/list.php?id={$question.id}">{$question.topicname}</a>
						</div>
						<hr>
						<div class="question_body">
							{$question.description|unescape:'html'}
						</div>
						<div class="question_coda">
							<div class="question_tags">
								{foreach $tags as $tag}
								<a class="label label-default" href="#">{$tag}</a>
								{/foreach}
							</div>
							<div class="question_votes">
								<label> Was this question relevant? Please leave a vote! </label>
								<input id="js-question-id" type="hidden" value="{$question.post_id}">
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
								</button>
								<button id="js-upvote-btn" type="button" class="btn btn-default" {if !$USERNAME} disabled{/if}>
									<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">{$question.up_score}</span>
								</button>
								<button id="js-downvote-btn" type="button" class="btn btn-default" {if !$USERNAME} disabled{/if}>
									<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">{$question.down_score}</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>

		<div class="col-lg-8 answers">

			<div class="answers_header">
				Answers <span class="answer_no">{sizeof($answers)}</span>
			</div>

			{foreach $answers as $answer}
				{include file='answers/list.tpl' answer=$answer}
			{/foreach}
		</div>
	</div>
</div>

{include file='common/footer.tpl'}
