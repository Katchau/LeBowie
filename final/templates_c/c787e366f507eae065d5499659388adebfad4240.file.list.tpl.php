<?php /* Smarty version Smarty-3.1.15, created on 2017-04-19 11:23:17
         compiled from "/opt/lbaw/lbaw1651/public_html/proto/templates/topic/list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:190581078758f735dc807601-90526350%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c787e366f507eae065d5499659388adebfad4240' => 
    array (
      0 => '/opt/lbaw/lbaw1651/public_html/proto/templates/topic/list.tpl',
      1 => 1492597344,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '190581078758f735dc807601-90526350',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_58f735dc9aa6c1_80636528',
  'variables' => 
  array (
    'topic' => 0,
    'questions' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58f735dc9aa6c1_80636528')) {function content_58f735dc9aa6c1_80636528($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ('common/scriptlist.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<div class="container" id="topicBody">

   <div class="row">

     <div class="extras hidden-xs col-sm-4 col-lg-push-8 col-md-push-8 col-sm-push-8">
       <label class="tools_label topicTitle"> <?php echo $_smarty_tpl->tpl_vars['topic']->value['topicname'];?>
 </label>
       <hr>
       <div class="guidelines_side">
         <h1>About <?php echo $_smarty_tpl->tpl_vars['topic']->value['topicname'];?>
</h1>
         <p class="topicInfo"><?php echo $_smarty_tpl->tpl_vars['topic']->value['description'];?>
</p>
	  <button type="button" class="btn btn-default askButton">
           <span aria-hidden="true"> ask a question</span>
         </button>
       </div>
       <hr>
     </div>
	<div class="ask_area col-sm-8 col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
        <h1 class="hidden-lg hidden-md hidden-sm topicTitle"><?php echo $_smarty_tpl->tpl_vars['topic']->value['topicname'];?>
</h1>
	<p class="hidden-lg hidden-md hidden-sm"><?php echo $_smarty_tpl->tpl_vars['topic']->value['description'];?>
</p>
	<?php echo $_smarty_tpl->getSubTemplate ('questions/listquestions.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array('questions'=>$_smarty_tpl->tpl_vars['questions']->value,'type'=>1), 0);?>

	</div>
	</div>
</div><?php }} ?>
