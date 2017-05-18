{include file='common/header.tpl'} {include file='common/scriptlist.tpl'}

<div class="container">

  <div class="row">

    <div class="extras hidden-xs col-sm-4 col-lg-push-8 col-md-push-8 col-sm-push-8">
      <label class="tools_label"> guidelines <span class="glyphicon glyphicon-question-sign"></span></label>
      <hr>
      <div class="guidelines_side">
        <h1>on creating a topic</h1>
        <p>Create a topic if it's highly requested or in case of need.</p>
        <p>Make sure the topic information is clear and add atleast 5 rules to maintain order in the topic thread.</p>
        <p>Make sure to assign at least 5 moderators to it so nothing goes bananas content-wise.</p>
        <p>See if there is any user worth promoting to moderate this topic to avoid moderator overwork.</p>
      </div>
      <hr>
    </div>

    <div class="ask_area col-sm-8 col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
      <h1 class="hidden-lg hidden-md hidden-sm">Create Topic</h1>
      <form action="{$BASE_URL}actions/topics/" method="post" id="form-topic-new">
        <input name="topic-admin-id" type="hidden" value="{$USERID}" >
        <div class="form-group well">
          <label for="question_header_title" class="col-2 col-form-label">Topic Name</label>
          <textarea class="form-control" name="topic-title" rows="1" id="question_header_title" placeholder="enter your topic name here"></textarea>
          <hr>
          <label for="question_header_contents" class="col-2 col-form-label">Information about Topic</label>
          <textarea name="topic-description" class="form-control" rows="5" id="question_header_contents" placeholder="write down the content you wish to see questions about"></textarea>
          <hr>
          <label for="question_header_contents" class="col-2 col-form-label">Rules of the website (optional):</label>
          <textarea name="topic-rules" class="form-control" rows="1" placeholder="enter your rules, separated by commas"></textarea>
        </div>

        <div class="well">
          <p><span class="glyphicon glyphicon-warning-sign"></span> Remember: You can later edit anything on the topic page
            except the name!</p>
        </div>
      </form>
      <div class="text-right"><button class="btn" form="form-topic-new" value="Submit">Submit</button></div>
      <div class="buffer_area"></div>
    </div>
  </div>

</div>

{include file='common/footer.tpl'}