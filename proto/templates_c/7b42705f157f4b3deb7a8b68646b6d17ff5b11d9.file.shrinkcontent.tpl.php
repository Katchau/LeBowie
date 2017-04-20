<?php /* Smarty version Smarty-3.1.15, created on 2017-04-19 18:20:11
         compiled from "/opt/lbaw/lbaw1651/public_html/proto/templates/common/shrinkcontent.tpl" */ ?>
<?php /*%%SmartyHeaderCode:173073536058f696e88097b1-33661863%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7b42705f157f4b3deb7a8b68646b6d17ff5b11d9' => 
    array (
      0 => '/opt/lbaw/lbaw1651/public_html/proto/templates/common/shrinkcontent.tpl',
      1 => 1492609134,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '173073536058f696e88097b1-33661863',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_58f696e8883400_48698754',
  'variables' => 
  array (
    'description' => 0,
    'size' => 0,
    'cut' => 0,
    'pos' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58f696e8883400_48698754')) {function content_58f696e8883400_48698754($_smarty_tpl) {?><div class="collapse-group">
	<?php $_smarty_tpl->tpl_vars["size"] = new Smarty_variable(300, null, 0);?>
	<?php if (strlen($_smarty_tpl->tpl_vars['description']->value)<$_smarty_tpl->tpl_vars['size']->value) {?>
		<p class="smallText">
			<?php echo $_smarty_tpl->tpl_vars['description']->value;?>

		</p>
	<?php } else { ?>
		<?php $_smarty_tpl->tpl_vars["cut"] = new Smarty_variable(substr($_smarty_tpl->tpl_vars['description']->value,$_smarty_tpl->tpl_vars['size']->value,strlen($_smarty_tpl->tpl_vars['description']->value)), null, 0);?>
		<?php $_smarty_tpl->tpl_vars["pos"] = new Smarty_variable(strpos($_smarty_tpl->tpl_vars['cut']->value,' ')+$_smarty_tpl->tpl_vars['size']->value, null, 0);?>
		<?php if ($_smarty_tpl->tpl_vars['pos']->value==$_smarty_tpl->tpl_vars['size']->value) {?>
			<p class="smallText">
				<?php echo $_smarty_tpl->tpl_vars['description']->value;?>

			</p>
		<?php } else { ?>
			<p class="smallText">
				<?php echo substr($_smarty_tpl->tpl_vars['description']->value,0,$_smarty_tpl->tpl_vars['pos']->value);?>

			</p>
			<p class="collapse">
				<?php echo substr($_smarty_tpl->tpl_vars['description']->value,$_smarty_tpl->tpl_vars['pos']->value,strlen($_smarty_tpl->tpl_vars['description']->value));?>

			</p>
			<p><a class="viewmore" href="#">View more..</a></p>
		<?php }?>
	<?php }?>
</div><?php }} ?>
