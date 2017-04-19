{include file='common/header.tpl'}
{include file='common/scriptlist.tpl'}
	
	<!-- profile area -->
    <div class="container profile">
      <div class="row">

        <div class="hidden-xs col-lg-8 media">
          <div class="profile-upper">
            <div class="profile-image-and-info">
              {if isset($user.image)}
			  <img class="user_profile_pic2 img-thumbnail" src="{$BASE_URL}img/profile.png" alt="user_image">
			  {else}
			  <img class="user_profile_pic2 img-thumbnail" src="{$BASE_URL}img/{$user.id}/{$user.image} alt="user_image">
			  {/if}
              <hr>
              <div class="profile-info">
                <span class="info-start">Email: </span>{$user.email}
                <br>
                <span class="info-start">Name: </span>{$user.first_name}
                <br>
                <span class="info-start">Surname: </span>{$user.last_name}
                <br>
                <span class="info-start">Country: </span>{$user.name}
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
					{assign "value" 0}
					{foreach $topics as $topic}
					{assign "value" $value+1}
                    <li><a href="{$BASE_URL}pages/topic/list.php?id={$topic.topic_id}">
					{$topic.topicname}
					</a></li>
					{if $value == 4}
					{break}
					{/if}
                    {/foreach}
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
			  {$user.description}
              </div>
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
              {if isset($user.image)}
			  <img class="user_profile_pic2 img-thumbnail" src="{$BASE_URL}img/profile.png" alt="user_image">
			  {else}
			  <img class="user_profile_pic2 img-thumbnail" src="{$BASE_URL}img/{$user.id}/{$user.image} alt="user_image">
			  {/if}
              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-xs-12 profile-info">
                <span class="info-start">Email: </span>{$user.email}
                <br>
                <span class="info-start">Name: </span>{$user.first_name}
                <br>
                <span class="info-start">Surname: </span>{$user.last_name}
                <br>
                <span class="info-start">Country: </span>{$user.name}
              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-xs-12 profile-desc">
                Prism letterpress farm-to-table, food truck butcher seitan tilde tacos glossier affogato activated charcoal kombucha dreamcatcher. Copper mug wayfarers tumeric snackwave normcore, freegan kitsch organic humblebrag kickstarter hella quinoa skateboard. Jean shorts ethical pug, fashion axe wayfarers trust fund YOLO man bun live-edge af brunch mumblecore fam actually thundercats. Master cleanse VHS pork belly, flannel live-edge glossier man bun. Aesthetic celiac you probably haven't heard of them.

                <hr>
              </div>
            </div>

            <div class="row">
              <div class="col-xs-6 profile-badges">
                <span class="info-start">User Badges </span>
                <br>
                <span class="label label-default">2 years club</span>
                <span class="label label-primary">200 questions</span>
                <br>
                <span class="label label-success">400 answers</span>
                <span class="label label-info">{$user.score} </span>
              </div>
              <div class="col-xs-6 profile-topics">
                <label class="info-start">Most frequented topics</label> <br>
                <ul class="">
                  {assign "value" 0}
					{foreach $topics as $topic}
					{assign "value" $value+1}
                    <li><a href="{$BASE_URL}pages/topic/list.php?id={$topic.topic_id}">
					{$topic.topicname}
					</a></li>
					{if $value == 4}
					{break}
					{/if}
                    {/foreach}
                </ul>
              </div>
            </div>

          </div>

            <hr>
        </div>

        <div class="col-lg-4 container-fluid profile-q-and-a">
          <div class="extras_suggested">
            <label class="related_label"> Submitted Questions </label>
            <ul class="list-group" >
              {assign "value" 0}
			  {foreach $questions as $question}
			  {assign "value" $value+1}
			  <li><a href="{$BASE_URL}pages/questions/index.php?id={$question.post_id}">
			  {$question.title}
			  </a></li>
			  {if $value == 4}
			  {break}
			  {/if}
			  {/foreach}
            </ul>
          </div>
          <hr>
          <div class="extras_suggested">
            <label class="related_label"> Submitted Answers </label>
            <ul class="list-group" >
              {assign "value" 0}
			  {foreach $answers as $answer}
			  {assign "value" $value+1}
			  <li><a href="#">
			  {$answer.description}
			  </a></li>
			  {if $value == 3}
			  {break}
			  {/if}
			  {/foreach}
            </ul>
          </div>
          <hr>

        </div>
      </div>
    </div>