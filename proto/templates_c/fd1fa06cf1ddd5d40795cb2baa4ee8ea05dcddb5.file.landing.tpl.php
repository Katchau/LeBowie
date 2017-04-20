<?php /* Smarty version Smarty-3.1.15, created on 2017-04-19 18:20:11
         compiled from "/opt/lbaw/lbaw1651/public_html/proto/templates/frontpage/landing.tpl" */ ?>
<?php /*%%SmartyHeaderCode:104682416658f7696ba8cc11-52313976%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'fd1fa06cf1ddd5d40795cb2baa4ee8ea05dcddb5' => 
    array (
      0 => '/opt/lbaw/lbaw1651/public_html/proto/templates/frontpage/landing.tpl',
      1 => 1492622395,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '104682416658f7696ba8cc11-52313976',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_58f7696bc26f26_69051487',
  'variables' => 
  array (
    'hquestions' => 0,
    'rquestions' => 0,
    'bquestions' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58f7696bc26f26_69051487')) {function content_58f7696bc26f26_69051487($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ('common/scriptlist.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


  <div class="container">

    <div class="row welcome in" id="welcome">
      <div class="col-lg-1"></div>
      <div class="col-lg-10 jumbotron text-center">
        <br>
        <h1>Welcome to Newton's Apple!</h1>
        <p>In our website, anyone can ask a question about anything you want!</p>
        <p>To ask a question, simply press the <span class="orange">ask</span> button above. Make sure to browse existing questions though, as your question might have already been answered.</p>
        <br>
        <center><button class="btn btn-warning" data-toggle="collapse" data-target="#welcome">Ok!</button></center><br>
      </div>
      <div class="col-lg-1"></div>
    </div>

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
	  <?php echo $_smarty_tpl->getSubTemplate ('questions/listquestions.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('questions'=>$_smarty_tpl->tpl_vars['hquestions']->value,'type'=>0), 0);?>

          </div>

          <div class="tab-pane fade in" id="newq">
	  <?php echo $_smarty_tpl->getSubTemplate ('questions/listquestions.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('questions'=>$_smarty_tpl->tpl_vars['rquestions']->value,'type'=>0), 0);?>

          </div>
          <div class="tab-pane fade in  " id="bestq">
  	  <?php echo $_smarty_tpl->getSubTemplate ('questions/listquestions.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('questions'=>$_smarty_tpl->tpl_vars['bquestions']->value,'type'=>0), 0);?>

          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-1"></div>
  </div>
  
  <?php echo $_smarty_tpl->getSubTemplate ('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
<?php }} ?>
