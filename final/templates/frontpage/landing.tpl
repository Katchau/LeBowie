{include file='common/header.tpl'}

<div class="container">

  {if !$FIRST_VISIT}
  <div class="row welcome in" id="welcome">
    <div class="col-lg-1"></div>
    <div class="col-lg-10 jumbotron text-center">
      <br>
      <h1>Welcome to Newton's Apple!</h1>
      <p>In our website, anyone can ask a question about anything you want!</p>
      <p>To ask a question, simply press the <span class="orange">ask</span> button above. Make sure to browse existing questions
        though, as your question might have already been answered.</p>
      <br>
      <center><button class="btn btn-warning" data-toggle="collapse" data-target="#welcome" onclick="hideBanner()">Got it!</button></center><br>
    </div>
    <div class="col-lg-1"></div>
  </div>
  {/if}

  <div class="row">
    <!--<div class="col-lg-12 text-center">Newton's Apple</div>-->
  </div>

  <div class="row">
    <div class="col-lg-1"></div>
    <div class="col-lg-10 board-inner">

      <ul class="nav nav-tabs" id="tabs">
        <div class="liner"></div>

        <li class="question_tab active">
          <a href="#hotq" data-toggle="tab" title="hottest questions">
              <span class="round-tabs one">
                <i class="glyphicon glyphicon-fire"></i> hot
              </span>
            </a>
        </li>

        <li class="question_tab">
          <a href="#newq" data-toggle="tab" title="newest questions">
              <span class="round-tabs one">
                <i class="glyphicon glyphicon-time"></i> newest
              </span>
            </a>
        </li>

        <li class="question_tab">
          <a href="#bestq" data-toggle="tab" title="best questions">
              <span class="round-tabs one">
                <i class="glyphicon glyphicon-apple"></i> best
              </span>
            </a>
        </li>

      </ul>

      <div class="tab-content">

        <div class="tab-pane fade in active" id="hotq">
          {include file='questions/listquestions.tpl' questions=$hquestions type=0}
          <button class="btn btn-default" id="view-more-hot" onclick="getMoreHotQuestions()">View more</button>
        </div>

        <div class="tab-pane fade in" id="newq">
          {include file='questions/listquestions.tpl' questions=$rquestions type=0}
          <button class="btn btn-default" id="view-more-new" onclick="getMoreNewQuestions()">View more</button>
        </div>
        <div class="tab-pane fade in  " id="bestq">
          {include file='questions/listquestions.tpl' questions=$bquestions type=0}
          <button class="btn btn-default" id="view-more-best" onclick="getMoreBestQuestions()">View more</button>
        </div>
      </div>
    </div>
  </div>
  <div class="col-lg-1"></div>
</div>

{include file='common/footer.tpl'}