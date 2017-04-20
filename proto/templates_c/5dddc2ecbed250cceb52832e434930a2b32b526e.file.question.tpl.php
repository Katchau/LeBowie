<?php /* Smarty version Smarty-3.1.15, created on 2017-04-19 18:33:03
         compiled from "/opt/lbaw/lbaw1651/public_html/proto/templates/questions/question.tpl" */ ?>
<?php /*%%SmartyHeaderCode:153200080358f78521aa9169-98607106%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5dddc2ecbed250cceb52832e434930a2b32b526e' => 
    array (
      0 => '/opt/lbaw/lbaw1651/public_html/proto/templates/questions/question.tpl',
      1 => 1492623179,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '153200080358f78521aa9169-98607106',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_58f78521c31611_95302509',
  'variables' => 
  array (
    'question' => 0,
    'BASE_URL' => 0,
    'tags' => 0,
    'tag' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58f78521c31611_95302509')) {function content_58f78521c31611_95302509($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ('common/scriptlist.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


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
          <label class="tools_label"> tools <span class="glyphicon glyphicon-wrench"></span></label>
          <hr>
          <div class="extras_tools">
            <button type="button" class="btn btn-default">
              <span aria-hidden="true"> answer</span>
            </button>
            <button type="button" class="btn btn-default">
              <span aria-hidden="true"> ask a question</span>
            </button>
          </div>
          <hr>
          <div class="extras_suggested">
            <label class="related_label"> related questions </label>
            <ul class="list-group" ></ul>
          </div>
          <hr>
        </div>
		
		<div class="col-sm-8 question_area col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
			<div class="question">
				<div class="media">
					<div class="media-left">
						<a href="#">
							<img class="hidden-xs media-object user_profile_pic" src="http://placehold.it/64x64" alt="user_image">
						</a>
					</div>
					<div class="media-body question_area">
						<h3 class="media-heading">
							<?php echo $_smarty_tpl->tpl_vars['question']->value['title'];?>

						</h3>
						<div class="question_details"> asked by
							<a class="question_author" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/users/index.php?username=<?php echo $_smarty_tpl->tpl_vars['question']->value['username'];?>
"><?php echo $_smarty_tpl->tpl_vars['question']->value['username'];?>
</a> on <span class="question_date"><?php echo $_smarty_tpl->tpl_vars['question']->value['creation'];?>
</span> in <a class="question_topic" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/topic/list.php?id=<?php echo $_smarty_tpl->tpl_vars['question']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['question']->value['topicname'];?>
</a>
						</div>
						<hr>
						<div class="question_body">
							<?php echo htmlspecialchars_decode($_smarty_tpl->tpl_vars['question']->value['description'], ENT_QUOTES);?>

						</div>
						<div class="question_coda">
							<div class="question_tags">
								<?php  $_smarty_tpl->tpl_vars['tag'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['tag']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['tags']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['tag']->key => $_smarty_tpl->tpl_vars['tag']->value) {
$_smarty_tpl->tpl_vars['tag']->_loop = true;
?>
								<a class="label label-default" href="#"><?php echo $_smarty_tpl->tpl_vars['tag']->value;?>
</a>
								<?php } ?>
							</div>
							<div class="question_votes">
								<label> Was this question relevant? Please leave a vote! </label>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><?php echo $_smarty_tpl->tpl_vars['question']->value['up_score'];?>
</span>
								</button>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"><?php echo $_smarty_tpl->tpl_vars['question']->value['down_score'];?>
</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</div>

	<div class="col-lg-8 answers">
		<div class="answers_header"> 
			Answers <span class="answer_no">(0)</span>
		</div>

		<div class="answer">
		</div>
	</div>
</div>


  <?php echo $_smarty_tpl->getSubTemplate ('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php }} ?>
