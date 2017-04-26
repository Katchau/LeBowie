{include file='common/header.tpl'}
{include file='common/scriptlist.tpl'}


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
                <label class="tools_label"> guidelines <span class="glyphicon glyphicon-question-sign"></span></label>
                <hr>
                <div class="guidelines_side">
  		  <h1>on posting an answer</h1>
  		  <p>In this section you can post your answer to the question on the left. We value relevant answers above all, so any answer is subject of the vote system and filtered therein.</p>
  		  <p>If you still feel your answer is valuable and needed, please follow these guidelines on posting an answer:</p>
  		  <ul class="well">
  		      <li>Don't spam the question thread with answers.</li>
  		      <li>Don't ask for votes.</li>
  		      <li>Don't post inappropriate content, links, or images.</li>
  		      <li>Be concise, but thorough.</li>
  		      <li>Be relevant and helpful.</li>
  		      <li><strong>Be open to any comments, be them negative or positive.</strong></li>
  		  </ul>
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
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">{$question.up_score}</span>
								</button>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">{$question.down_score}</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>

		<div class="col-lg-12 answers">

			<div class="answers_header">
				Answer this question
			</div>
            <div class="answer_area">
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
                          <hr>
                          <hr>
                      </div>
                  </div>
                </div>
            </div>
		</div>
	</div>
</div>


{include file='common/footer.tpl'}
