{include file='common/header.tpl'}
{include file='common/scriptlist.tpl'}

<div class="col-sm-8 question_area col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
	<div class="question">
		<div class="media">
			<div class="media-left">
				<a href="#">
					<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image">
				</a>
			</div>
			<div class="media-body question_area">
				<h3 class="media-heading"> Can I have “adjustResize” soft keyboard behavior and a toolbar behind the status bar at the same time? </h3>
				<div class="question_details"> asked by
					<a class="question_author" href="#">KaitlynHanrahan</a> on <span class="question_date">24/02/2017</span> in <a class="question_topic" href="#">programming</a>
				</div>
				<hr>
				<div class="question_body">
					In my Android app, it is vital for me to use the adjustResize behavior for the soft keyboard. So users can scroll down to other UI elements, such as a "continue" button.
					I've noticed that that adjustResize only works when I have both the Manifest setting and <code>android:fitsSystemWindows="true"</code> in the layout root element. (Please correct me if I'm wrong!)
					But with <code>android:fitsSystemWindows="true"</code> the Toolbar no longer sits behind the Status Bar. Which makes perfect sense, but isn't what I want.
					When the Toolbar sits behind it, the status bar has a matching darker shade of my Toolbar's color. What I have with <code>android:fitsSystemWindows="true"</code> is a colorless status bar and a toolbar that sits 24dp lower than I want it.
					I will give up the matching colored Status Bar for the sake of the adjustResize keyboard behavior. But my question is, is it possible to have both? Dare I dream for both Beauty and Accessibility?
					Anyone more experienced know the magical combination of settings? Or perhaps, as a work around, a way to explicitly color the status bar?
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
