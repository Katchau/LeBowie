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
                <h1>on posting a comment</h1>
                <p>In this section you can post your comment to the answer to the question on the left.</p>
                <p>Please follow these guidelines on posting a comment:</p>
                <ul class="well">
                    <li>Don't spam the answer thread with comments.</li>
                    <li>Don't post inappropriate content, links, or images.</li>
                    <li>Be concise, but thorough.</li>
                    <li>Be relevant and helpful.</li>
                    <li><strong>Be open to any further comments, be them negative or positive.</strong></li>
                </ul>
            </div>
            <hr>
        </div>

        <div class="col-sm-8 question_area col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
            <div class="question">
                <div class="media">
                    <div class="media-left">
                        <a href="#">
                            {if $answer.image == NULL}
							<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image"> 
							{else}
							<img class="hidden-xs media-object user_profile_pic" src="{$BASE_URL}images/users/{$answer.user_id}/{$answer.image}" alt="user_image">
							{/if}
                        </a>
                    </div>
                    <div class="media-body question_area">
                        <h3 class="media-heading">
                            You selected to comment on this:
                        </h3>
                        <div class="question_details"> answered by
                            <a class="question_author" href="{$BASE_URL}pages/users/index.php?username={$answer.username}">{$answer.username}</a> on <span class="question_date">{$answer.creation}</span> 
                        </div>
                        <hr>
                        <div class="question_body">
                            {$answer.description|unescape:'html'}
                        </div>
                     
                        <div class="question_coda">
                            <div class="question_votes">
								{if isset($USERID)}
                                <label> Was this answer relevant? Please leave a vote! </label>
                                <button type="button" class="btn btn-default">
                                    <span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
                                </button>
								
                                <button type="button" class="btn btn-default">
                                    <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true" {if ($USERNAME == $answer.username)} disabled {/if}>{$answer.up_score}</span>
                                </button>
                                <button type="button" class="btn btn-default">
                                    <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true" {if ($USERNAME == $answer.username)} disabled {/if} >{$answer.down_score}</span>
                                </button>
								{/if}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>

        <div class="col-lg-12 answers">

            <div class="answers_header">
                Comment on this answer
            </div>
            <div class="answer_area">
				{if isset($USERID)}
                <form action="{$BASE_URL}actions/comments/" method="post" id="form-comment">
                    <div class="form-group">
                        <input name="comment-user-id" type="hidden" value="{$USERID}" >
                        <input name="comment-answer-id" type="hidden" value="{$answer.answer}" >
                        <input name="comment-question-id" type="hidden" value="{$answer.question}">
                        <textarea name="comment-body" rows="4" cols="100" class="form-control input-lg" placeholder="Enter your comment here."></textarea>
                    </div>
                    <input type="submit" value="Submit Comment" form="form-comment" class="btn btn-default" tabindex="7">
                </form>
				{/if}
                <hr>
                <br>
            </div>
        </div>
    </div>
</div>


{include file='common/footer.tpl'}
