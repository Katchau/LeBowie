{include file='common/header.tpl'}

<div id="extras-side-nav" class="side-nav">
    <div class="panel side-nav-guidelines">
        <div class="panel-body">
            <h3>on creating a report</h3>
            <hr>
            <p>These are the guidelines to create a report.</p>
            <hr>
            <ul>
                <li>Don't spam our topics with questions.</li>
                <li>Don't ask for votes.</li>
                <li>Don't post inappropriate content, links, or images.</li>
                <li>Be concise, but thorough.</li>
                <li>Be relevant and helpful.</li>
                <li><strong>Be open to any answer, but settle for the best.</strong></li>
            </ul>
        </div>
    </div>
</div>

</nav>

<div class="container">
    <div class="row">
        <div class="extras hidden-xs col-sm-4 col-lg-push-8 col-md-push-8 col-sm-push-8">
            <label class="tools_label"> guidelines <span class="glyphicon glyphicon-question-sign"></span></label>
            <hr>
            <div class="guidelines_side">
                <h1>on creating a report</h1>
                <p>These are the guidelines to create a report.</p>
                <ul class="well">
                    <li>Don't spam our topics with questions.</li>
                    <li>Don't ask for votes.</li>
                    <li>Don't post inappropriate content, links, or images.</li>
                    <li>Be concise, but thorough.</li>
                    <li>Be relevant and helpful.</li>
                    <li><strong>Be open to any answer, but settle for the best.</strong></li>
                </ul>
            </div>
            <hr>
        </div>

        {if !isset($question) || $question == NULL} {else}
        <div class="col-sm-8 question_area col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
            <div class="question">
                <div class="media">
                    <div class="media-left">
						<a href="{$BASE_URL}pages/users/index.php?username={$question.username}">
							{if $question.image == NULL}
							<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image"> 
							{else}
							<img class="hidden-xs media-object user_profile_pic" src="{$BASE_URL}images/users/{$question.user_id}/{$question.image}" alt="user_image">
							{/if}
						</a>
					</div>
                    <div class="media-body question_area">
                        <h3 class="media-heading">
                            {$question.title}
                        </h3>
                        <div class="question_details"> asked by
							<a class="question_author" href="{$BASE_URL}pages/users/index.php?username={$question.username}">{$question.username}</a>							on <span class="question_date">{$question.creation}</span> in <a class="question_topic" href="{$BASE_URL}pages/topic/list.php?id={$question.id}">{$question.topicname}</a>
						</div>
                        <hr>
                        <div class="question_body">
                            {$question.description|unescape:'html'}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr> 
        {/if}

        {if !isset($content) || $content == NULL} {else}
        <div class="col-sm-8 question_area col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
            <div class="question">
                <div class="media">
                    <div class="media-body question_area">
                        <hr>
                        <div class="question_body">
                            {$content.description|unescape:'html'}
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
        {/if}
    </div>

    <div class="ask_area col-lg-8">
        <h1 class="hidden-lg hidden-md hidden-sm">Create a Report</h1>

        <form action="{$BASE_URL}actions/reports/" method="post" id="form-ask">
            {if !isset($question) || $question == NULL}
            <input name="user-id" type="hidden" value="{$question.user_id}">
            {else}
            <input name="user-id" type="hidden" value="{$content.user_id}">
            {/if}
            <input name="post-id" type="hidden" value="{$post_id}">
            <input name="question-id" type="hidden" value="{$question_id}">

            <div class="form-group well">
                <input type="hidden" name="report-title" value="_">

                <label for="report-reason" class="col-2 col-form-label">Report Reason</label>
                <textarea name="report-reason" class="form-control" rows="1" id="report-reason" placeholder="enter the reason for your report here"></textarea>

                <input type="hidden" name="report-content" value="_">
            </div>
        </form>

        <div class="text-right"><button class="btn" type="submit" form="form-ask" value="Submit">Submit Report</button></div>

        <div class="buffer_area"></div>
    </div>
</div>

{include file='common/footer.tpl'}