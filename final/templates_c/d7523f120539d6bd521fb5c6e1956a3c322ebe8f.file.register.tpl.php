<?php /* Smarty version Smarty-3.1.15, created on 2017-04-19 18:20:09
         compiled from "/opt/lbaw/lbaw1651/public_html/proto/templates/user/register.tpl" */ ?>
<?php /*%%SmartyHeaderCode:173583114158f786940ecc69-11779746%%*/if(!defined('SMARTY_DIR')) { exit('no direct access allowed'); 
}
$_valid = $_smarty_tpl->decodeProperties(
    array (
    'file_dependency' => 
    array (
    'd7523f120539d6bd521fb5c6e1956a3c322ebe8f' => 
    array (
      0 => '/opt/lbaw/lbaw1651/public_html/proto/templates/user/register.tpl',
      1 => 1492622395,
      2 => 'file',
    ),
    ),
    'nocache_hash' => '173583114158f786940ecc69-11779746',
    'function' => 
    array (
    ),
    'version' => 'Smarty-3.1.15',
    'unifunc' => 'content_58f7869425a9b4_09949545',
    'variables' => 
    array (
    'BASE_URL' => 0,
    ),
    'has_nocache_code' => false,
    ), false
); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58f7869425a9b4_09949545')) {function content_58f7869425a9b4_09949545($_smarty_tpl) 
    {
?><?php echo $_smarty_tpl->getSubTemplate('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate('common/scriptlist.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<div class="container">
	    <div class="row">
		<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		    <form role="form" class="register well text-center" method="post" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/register.php">
			<h2>Welcome to Newton's Apple!</h2>
			<h3><small>By becoming a new member, you now can ask anything you want, our help out other people! Just complete this registration process:</small></h3>
			<hr class="colorgraph">
			<div class="row">
			    <div class="col-xs-12 col-sm-6 col-md-6">
				<div class="form-group">
				    <input type="text" name="first_name" id="first_name" class="form-control input-lg" placeholder="First Name" tabindex="1">
				</div>
			    </div>
			    <div class="col-xs-12 col-sm-6 col-md-6">
				<div class="form-group">
				    <input type="text" name="last_name" id="last_name" class="form-control input-lg" placeholder="Last Name" tabindex="2">
				</div>
			    </div>
			</div>
			<div class="form-group">
			    <input type="text" name="display_name" id="display_name" class="form-control input-lg" placeholder="Username" tabindex="3">
			</div>
			<div class="form-group">
			    <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" tabindex="4">
			</div>
			<div class="row">
			    <div class="col-xs-12 col-sm-6 col-md-6">
				<div class="form-group">
				    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="5">
				</div>
			    </div>
			    <div class="col-xs-12 col-sm-6 col-md-6">
				<div class="form-group">
				    <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirm Password" tabindex="6">
				</div>
			    </div>
			</div>
			
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group date text-center" data-provide="datepicker">
						<input type="date" class="form-control" name="birth"> 
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="form-group">
				    <input type="text" name="country" id="countryform" class="form-control input-lg" placeholder="Enter Country" tabindex="6">
				</div>
			    </div>
				
			</div>

			<hr class="colorgraph">
			<div class="row">
			    <div class="col-xs-12 col-md-12"><input type="submit" value="Register" class="btn btn-primary btn-block btn-lg btn-warning" tabindex="7"></div>
			</div>
			<div class="row">
			    <div class="col-xs-12 col-md-12 already_have_account"><label>Already have an account? </label><a href="#" data-toggle="modal" data-target="#myModal">Sign In.</a></div>
			</div>

			<hr class="colorgraph">
			<div class="row">
			    <div class="col-md-3"></div>
			    <div class="col-xs-12 col-md-6">
				<label>or</label>
				<a class="btn btn-block btn-social btn-google">
				    <i class="fa fa-google" aria-hidden="true"></i> Sign up with Google
				</a>
			    </div>
			    <div class="col-md-3"></div>
			</div>
		    </form>
		</div>
	    </div>
	</div>
    <?php echo $_smarty_tpl->getSubTemplate('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
<?php }
} ?>
