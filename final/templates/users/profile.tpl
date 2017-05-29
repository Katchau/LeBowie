{include file='common/header.tpl'}

<!-- profile area -->
<div class="container profile">
    <div class="row">

        <div class="hidden-xs col-lg-8 media">
            <div class="profile-upper">
                {if !isset($user) || $user == NULL} Invalid Username! Maybe the account was deleted? {/if}
                <div class="profile-image-and-info">
                    {if $user.image == NULL}
                    <img class="user_profile_pic2 img-thumbnail" src="{$BASE_URL}images/profile.png" alt="user_image"> {else}
                    <img class="user_profile_pic2 img-thumbnail" src="{$BASE_URL}images/users/{$user.id}/{$user.image}" alt="user_image">                    {/if}
                    <hr>
                    <div class="profile-info">
                        <span class="info-start">Email: </span>{$user.email}
                        <br>
                        <span class="info-start">Name: </span>{$user.first_name}
                        <br>
                        <span class="info-start">Surname: </span>{$user.last_name}
                        <br>
                        <span class="info-start">Country: </span>{$user.name} {if $user.username == $USERNAME}
                        <form action="{$BASE_URL}pages/users/edit.php?username={$user.username}">
                            <input type="submit" value="Edit Profile" class="btn btn-default">
                        </form>
                        {/if}
                        <hr>
                        <div class="profile-badges">
                            <span class="info-start">User Badges </span>
                            <br>
                            <span class="label label-default">2 years club</span>
                            <span class="label label-primary">200 questions</span>
                            <br>
                            <span class="label label-success">400 answers</span>
                            <span class="label label-info">{$user.score} user score </span>
                        </div>
                    </div>
                    <hr>
                    <div class="profile-down">
                        <div class="profile-topics">
                            <label class="info-start">Most frequented topics</label> <br>
                            <ul class="">
                                {assign "value" 0} {foreach $topics as $topic} {assign "value" $value+1}
                                <li><a href="{$BASE_URL}pages/topic/list.php?id={$topic.topic_id}">
					{$topic.topicname}
					</a></li>
                                {if $value == 4} {break} {/if} {/foreach}
                            </ul>
                        </div>

                    </div>
                </div>

                <div class="profile-user-and-desc">
                    <div class="media-body profile-username">
                        {$user.username}
                    </div>
                    <div class="profile-user-score">
                        <span class="user_score"> {$user.score} </span> user score
                    </div>
                    <hr>
                    <div class="profile-desc">
                        {if $user.description == NULL } This user hasn't added a description! {else} {$user.description} {/if}
                    </div>
                    <hr>
                </div>
            </div>

        </div>

        <div class="container hidden-sm hidden-md hidden-lg mobile_profile">
            <div class="profile-user-and-desc">
                <div class="row">
                    <div class="col-xs-8">
                        <div class="media-body profile-username">
                            {$user.username}
                        </div>
                        <div class="profile-user-score">
                            <span class="user_score"> {$user.score} </span> user score
                        </div>
                    </div>
                    <div class="col-xs-4 text-right">
                        {if $user.image == NULL}
                        <img class="user_profile_pic2 img-thumbnail" src="{$BASE_URL}img/profile.png" alt="user_image"> {else}
                        <img class="user_profile_pic2 img-thumbnail" src="{$BASE_URL}img/{$user.id}/{$user.image}" alt="user_image">                        {/if}
                    </div>
                </div>

                <hr>

                <div class="row ">
                    <div class="col-xs-12 profile-info ">
                        <span class="info-start ">Email: </span>{$user.email}
                        <br>
                        <span class="info-start ">Name: </span>{$user.first_name}
                        <br>
                        <span class="info-start ">Surname: </span>{$user.last_name}
                        <br>
                        <span class="info-start ">Country: </span>{$user.name}
                    </div>
                </div>

                <hr>

                <div class="row ">
                    <div class="col-xs-12 profile-desc ">
                        Prism letterpress farm-to-table, food truck butcher seitan tilde tacos glossier affogato activated charcoal kombucha dreamcatcher.
                        Copper mug wayfarers tumeric snackwave normcore, freegan kitsch organic humblebrag kickstarter hella
                        quinoa skateboard. Jean shorts ethical pug, fashion axe wayfarers trust fund YOLO man bun live-edge
                        af brunch mumblecore fam actually thundercats. Master cleanse VHS pork belly, flannel live-edge glossier
                        man bun. Aesthetic celiac you probably haven't heard of them.

                        <hr>
                    </div>
                </div>

                <div class="row ">
                    <div class="col-xs-6 profile-badges ">
                        <span class="info-start ">User Badges </span>
                        <br>
                        <span class="label label-default ">2 years club</span>
                        <span class="label label-primary ">200 questions</span>
                        <br>
                        <span class="label label-success ">400 answers</span>
                        <span class="label label-info ">{$user.score} </span>
                    </div>
                    <div class="col-xs-6 profile-topics ">
                        <label class="info-start ">Most frequented topics</label> <br>
                        <ul class=" ">
                            {assign "value " 0} {foreach $topics as $topic} {assign "value " $value+1}
                            <li><a href="{$BASE_URL}pages/topic/list.php?id={$topic.topic_id} ">
					{$topic.topicname}
					</a></li>
                            {if $value == 4} {break} {/if} {/foreach}
                        </ul>
                    </div>
                </div>

            </div>

            <hr>
        </div>

        <div class="col-lg-4 container-fluid profile-q-and-a ">
            <div class="extras_suggested ">
                <label class="related_label "> Submitted Questions </label>
                <ul class="list-group ">
                    {assign "value " 0} {if $questions|@count == 0}
                    <div class="none_found jumbotron">
                        No questions submitted yet!
                    </div>
                    {else} {foreach $questions as $question} {assign "value " $value+1}
                    <li><a class="list-group-item suggestion " href="{$BASE_URL}pages/questions/index.php?id={$question.post_id} ">
			  {substr($question.title,0,200)}
			  <span class="badge ">{$question.up_score}</span>
			  </a></li>
                    {if $value == 4} {break} {/if} {/foreach} {/if}
                </ul>
            </div>
            <hr>
            <div class="extras_suggested ">
                <label class="related_label "> Submitted Answers </label>
                <ul class="list-group ">
                    {assign "value " 0} {if $answers|@count == 0}
                    <div class="none_found jumbotron">
                        No answers submitted yet!
                    </div>
                    {else} {foreach $answers as $answer} {assign "value " $value+1}
                    <li><a class="list-group-item suggestion " href="{$BASE_URL}pages/questions/index.php?id={$answer.question} ">
			  {substr($answer.description,0,200)}
                        <span class="badge ">{$answer.up_score}</span></a></li>
                    {if $value == 3} {break} {/if} {/foreach} {/if}
                </ul>
            </div>
            <hr>

        </div>
    </div>
    {if $MODERATOR && $user.username == $USERNAME}
    <div class="report-section">
        <div class="media-body profile-username">
            Report Section
        </div>
        {if $reports != false} {include file='reports/listreports.tpl' reports=$reports} {/if}
    </div>
    {/if}
</div>

<script src="{$BASE_URL}javascript/users/reports.js"></script>

{include file='common/footer.tpl'}