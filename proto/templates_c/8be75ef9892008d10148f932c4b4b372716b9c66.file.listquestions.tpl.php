<?php /* Smarty version Smarty-3.1.15, created on 2017-04-19 18:20:11
         compiled from "/opt/lbaw/lbaw1651/public_html/proto/templates/questions/listquestions.tpl" */ ?>
<?php /*%%SmartyHeaderCode:183484271858f640143d6522-59602594%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8be75ef9892008d10148f932c4b4b372716b9c66' => 
    array (
      0 => '/opt/lbaw/lbaw1651/public_html/proto/templates/questions/listquestions.tpl',
      1 => 1492622395,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '183484271858f640143d6522-59602594',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_58f64014540f43_20076870',
  'variables' => 
  array (
    'questions' => 0,
    'BASE_URL' => 0,
    'question' => 0,
    'type' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58f64014540f43_20076870')) {function content_58f64014540f43_20076870($_smarty_tpl) {?>
  <?php  $_smarty_tpl->tpl_vars['question'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['question']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['questions']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['question']->key => $_smarty_tpl->tpl_vars['question']->value) {
$_smarty_tpl->tpl_vars['question']->_loop = true;
?>
		
	<div class="question well">
		<h2 class ="questionTitle"><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/index.php?id=<?php echo $_smarty_tpl->tpl_vars['question']->value['post_id'];?>
"><?php echo $_smarty_tpl->tpl_vars['question']->value['title'];?>
</a> </h2>
		<p class="questionInfo">
			asked by <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/users/index.php?username=<?php echo $_smarty_tpl->tpl_vars['question']->value['username'];?>
" class="writer"> <?php echo $_smarty_tpl->tpl_vars['question']->value['username'];?>
 </a> on <?php echo $_smarty_tpl->tpl_vars['question']->value['creation'];?>
 
			<?php if ($_smarty_tpl->tpl_vars['type']->value!=1) {?>
			in <a class="topic" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/topic/list.php?id=<?php echo $_smarty_tpl->tpl_vars['question']->value['id'];?>
"> <?php echo $_smarty_tpl->tpl_vars['question']->value['topicname'];?>
 </a>
			<?php }?>
			<?php if ($_smarty_tpl->tpl_vars['type']->value!=0) {?>
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> <?php echo $_smarty_tpl->tpl_vars['question']->value['up_score'];?>
 </span>
			</button>
			<button type="button" class="btn btn-default">
				<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"> <?php echo $_smarty_tpl->tpl_vars['question']->value['down_score'];?>
 </span>
			</button>
			<?php }?>
		</p>
		<div class="postBody">
			<?php echo $_smarty_tpl->getSubTemplate ('common/shrinkcontent.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('description'=>$_smarty_tpl->tpl_vars['question']->value['description']), 0);?>

			<hr>
			<div class="bestanswer">
				<?php if (isset($_smarty_tpl->tpl_vars['question']->value['answer'])) {?>
				 <span class="top-answer">Accepted Answer</span>
				<?php echo $_smarty_tpl->getSubTemplate ('common/shrinkcontent.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('description'=>$_smarty_tpl->tpl_vars['question']->value['answer_desc']), 0);?>

				<p class="writerInfo">
					answered by <a href="#" class="writer"> <?php echo $_smarty_tpl->tpl_vars['question']->value['answer_user_name'];?>
 </a> on <?php echo $_smarty_tpl->tpl_vars['question']->value['answer_creation'];?>

				</p>
				<?php } else { ?>
				<p>
					There hasn't been an accepted answer to this question!
				</p>
				<?php }?>
				<button type="button" class="btn btn-default">
					<span aria-hidden="true"> Add an Answer </span>
				</button>
			</div>
		</div>
	</div>

  <?php } ?><?php }} ?>
