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

    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
	<script src="js/navbar.js"></script>
  </head>
  <header>
    <!-- Add your site or application content here -->

    <!-- Navbar -->
    <nav class="navbar navbar-default navbar-fixed-top"> <!-- para tirar o fixo basta remover o navbar-fixed-top-->
      <div class="container-fluid">
        
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <!-- Toggle shows only on mobile or small screens -->
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>

          <!-- Brand -->
		  <a class="navbar-brand" href="#">Newton's </a>
		  <a href="#" class="navbar-left"><img src="doc/images/prototype2.png" onmouseover="changeLogo()" onmouseout="resetLogo()"></a>
          
          <!-- Brand image -->
          <!-- <a class="navbar-brand" href="#">
               <img alt="Brand" src="img/logo.png">
          </a> -->
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

          <!-- Topic chosing dropdown -->
          <ul class="nav navbar-nav navbar-choose-topic">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">programming <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">mathematics</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">biology</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">rocket science</a></li>
              </ul>
            </li>
          </ul>
          
          <ul class="nav navbar-nav navbar-right">
            <li class="navbar-highlight"><a href="#">ask</a></li>
            {if $USERNAME}
            <li><a href="#">{$USERNAME}</a></li>
            <li><a href="#">sign out</a></li>
            {else}
            <li><a href="#">sign up</a></li>
            <li><a href="#">sign in</a></li>
            {/if}
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
          
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
</header>