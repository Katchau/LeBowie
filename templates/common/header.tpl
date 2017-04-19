<!doctype html>
<html class="no-js" lang="">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <!-- Place favicon.ico in the root directory -->

    <link rel="stylesheet" href="{$BASE_URL}css/normalize.css">
    <link rel="stylesheet" href="{$BASE_URL}css/main.css">
    <link rel="stylesheet" href="{$BASE_URL}css/navbar.css">
    <link rel="stylesheet" href="{$BASE_URL}css/question.css">
    <link rel="stylesheet" href="{$BASE_URL}css/search.css">
    <link rel="stylesheet" href="{$BASE_URL}css/topic.css">
    <link rel="stylesheet" href="{$BASE_URL}css/register.css">
    <link rel="stylesheet" href="{$BASE_URL}css/footer.css">
    <link rel="stylesheet" href="{$BASE_URL}css/tabs.css">
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
	<script src="js/navbar.js"></script>
  </head>
  <header>
    <!-- Add your site or application content here -->

   <!-- Navbar -->
  <nav class="navbar navbar-default">
    <div class="container-fluid">

      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" id="side-nav-button" onclick="openNav()">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <!-- Brand -->
        <a id="brand" class="navbar-brand" href="../../index.php">newton's<span class="brand-highlight">apple</span></a>
        <form id="mobile-search">
          <input id="mobile-search-bar" type="text" class="form-control" placeholder="search">
        </form>
        <i class="glyphicon glyphicon-option-vertical navbar-search"></i>
        <i id="mobile-close-search" class="glyphicon glyphicon-remove navbar-search"></i>
        <i id="mobile-search-icon" class="glyphicon glyphicon-search navbar-search"></i>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

        <!-- Topic chosing dropdown -->
        <ul class="nav navbar-nav navbar-choose-topic">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{$DEF_TOPIC}<span class="caret"></span></a>
            <ul class="dropdown-menu">
			  {foreach $headerTopics as $headerTopic}
				<li><a href="#">{$headerTopic['topicname']}</a></li>
				<li role="separator" class="divider"></li>
			  {/foreach}
            </ul>
          </li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
          {if $USERNAME}
			<li class="navbar-highlight"><a href="../../pages/questions/ask.php">ask</a></li>
          <li><a href="#">{$USERNAME}</a></li>
          <li><a href="{$BASE_URL}actions/logout.php">sign out</a></li>
          {else}
			<li class="navbar-highlight"><a href="#" data-toggle="modal" data-target="#myModal">ask</a></li>
          <li><a href="#">sign up</a></li>
          <li><a href="#" data-toggle="modal" data-target="#myModal">sign in</a></li>
          {/if}
		  

          <!-- Modal -->
          <div id="myModal" class="modal fade container col-xs-12" role="dialog">
            <div class="modal-dialog">

              <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title"><center>Sign in to Newton's Apple</center></h4>
                </div>
                <div class="modal-body">
				  <form method="post" action="{$BASE_URL}actions/login.php">
                  <div class="form-group">
            			    <input type="text" name="username" id="display_name" class="form-control input-lg" placeholder="Username/Email" tabindex="3">
            			</div>
                  <div class="form-group">
          				    <input type="password" name="password" id="password_confirmation" class="form-control input-lg" placeholder="Password" tabindex="6">
          				</div>
                  <div><button type="submit" class="btn btn-default">Sign in</button></div>
				 </form>
                </div>

                <div class="modal-footer">
                  <div class="row">
            			    <div class="col-xs-6 col-md-6">
            				<a class="btn btn-block btn-social btn-google">
            				    <i class="fa fa-google" aria-hidden="true"></i> Sign in with Google
            				</a>
            			    </div>
                      <div class="col-lg-3"></div>
            			    <div class="col-md-3"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
            			</div>

                </div>

              </div>

            </div>
          </div>

        </ul>

        <form class="navbar-form navbar-right">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit">
                <i class="glyphicon glyphicon-search"></i>
              </button>
            </div>
          </div>
        </form>

      </div>
    </div>

    <div id="my-side-nav" class="side-nav">
      <div class="side-nav-auth">
        <a href="#">sign up</a>
        <a href="#" data-toggle="modal" data-target="#myModal">sign in</a>
      </div>
      <hr>
      <div class="side-nav-options">
        <a href="#">ask</a>
      </div>
      <hr>
      <div class="side-nav-topics">
        <a href="#">programming</a>
        <a href="#">mathematics</a>
        <a href="#">biology</a>
        <a href="#">rocket science</a>
      </div>
    </div>
  </nav>
  <div id="error_messages">
	errors
    {foreach $ERROR_MESSAGES as $error}
      <div class="error">{$error}<a class="close" href="#">X</a></div>
    {/foreach}
    </div>
    <div id="success_messages">
	successes
    {foreach $SUCCESS_MESSAGES as $success}
      <div class="success">{$success}<a class="close" href="#">X</a></div>
    {/foreach}
    </div>
</header>