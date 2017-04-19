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
	<div class="row>
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
</div>