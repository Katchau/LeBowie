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
          <label class="tools_label"> tools <span class="glyphicon glyphicon-wrench"></span></label>
          <hr>
          <div class="extras_tools">
            <button type="button" class="btn btn-default">
              <span aria-hidden="true"> answer</span>
            </button>
            <button type="button" class="btn btn-default">
              <span aria-hidden="true"> ask a question</span>
            </button>
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
							<a class="question_author" href="#">KaitlynHanrahan</a> on <span class="question_date">24/02/2017</span> in <a class="question_topic" href="#">programming</a>
						</div>
						<hr>
						<div class="question_body">
							{$question.description|unescape:'html'}
						</div>
						<div class="question_coda">
							<div class="question_tags">
								<a class="label label-default" href="#">android</a>
								<a class="label label-default" href="#">layout</a>
								<a class="label label-default" href="#">android-layout</a>
								<a class="label label-default" href="#">android-styles</a>
							</div>
							<div class="question_votes">
								<label> Was this question relevant? Please leave a vote! </label>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> 7</span>
								</button>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"> 0</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</div>

	<div class="col-lg-8 answers">
		<div class="answers_header"> Answers <span class="answer_no">(1)</span>
	</div>

	<div class="answer">
		<div class="media">
			<div class="media-left">
				<a href="#">
					<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image" height="50px">
				</a>
			</div>
			<div class="media-body answer_area">
				<div class="answer_body">
					didn't got your question properly but as far I can understand to solve the problem-
					For the padding problem try adding
					<code>
						android:fitsSystemWindows="true"
						android:clipToPadding=”false”
					</code>
					And for the transparent status bar add
					<code>
						name="android:statusBarColor">@android:color/transparent
					</code>
					to your AppTheme. Hope it helps rest please upload the screenshot of your problem for detailed problem view.
				</div>
				<div class="answer_details"> answered by
					<a class="answer_author" href="#">ManmeetSingh</a> on <span class="answer_date">01/03/2017</span> at <span class="answer_hour">15:26</span>
				</div>
				<div class="answer_votes">
					<a class="badge" href="#"><span class="glyphicon glyphicon-ok"></span></a>
					<button type="button" class="btn btn-default comment_btn">
						<span aria-hidden="true">comment</span>
					</button>
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> 0</span>
					</button>
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"> 0</span>
					</button>
				</div>
				<hr>
				<div class="comment">
					<div class="comment_body">
						<a class="comment_author" href="#">KaitlynHanrahan</a>
						Didn't work. Thanks anyway.
					</div>
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<hr>
</div>
      </div>
</div>


  {include file='common/footer.tpl'}