<?php /* Smarty version Smarty-3.1.15, created on 2017-04-19 21:43:59
         compiled from "/opt/lbaw/lbaw1651/public_html/proto/templates/questions/ask.tpl" */ ?>
<?php /*%%SmartyHeaderCode:176902744258f68c02b39528-57278999%%*/if(!defined('SMARTY_DIR')) { exit('no direct access allowed'); 
}
$_valid = $_smarty_tpl->decodeProperties(
    array (
    'file_dependency' => 
    array (
    '7eb563e59c3dab8b2cab12c9c78fd21374b81332' => 
    array (
      0 => '/opt/lbaw/lbaw1651/public_html/proto/templates/questions/ask.tpl',
      1 => 1492622395,
      2 => 'file',
    ),
    ),
    'nocache_hash' => '176902744258f68c02b39528-57278999',
    'function' => 
    array (
    ),
    'version' => 'Smarty-3.1.15',
    'unifunc' => 'content_58f68c02cc0036_27542825',
    'variables' => 
    array (
    'BASE_URL' => 0,
    'USERID' => 0,
    'topics' => 0,
    'topic' => 0,
    ),
    'has_nocache_code' => false,
    ), false
); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58f68c02cc0036_27542825')) {function content_58f68c02cc0036_27542825($_smarty_tpl) 
    {
?><?php echo $_smarty_tpl->getSubTemplate('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate('common/scriptlist.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<div id="extras-side-nav" class="side-nav">
	<div class="panel side-nav-guidelines">
		<div class="panel-body">
			<h3>on asking a question</h3>
			<hr>
			<p>In this section you can post a question to ask the Newton's Apple community. We value relevant questions above all, so any question is subject of the vote system and filtered therein.</p>
			<p>We highly encourage browsing thoroughly through our database of questions before posting. Someone else may have posted it before!</p>
			<p>If all research has failed and you still need an answer, please follow these guidelines on posting a question:</p>
            <hr>
            <ul>
		<li>Don't spam our topics with questions.</li>
		<li>Don't ask for votes.</li>
		<li>Don't post inappropriate content, links, or images.</li>
		<li>Be concise, but thorough.</li>
		<li>Be relevant and helpful.</li>
		<li><strong>Be open to any answer, but settle for the best.</strong></li>
            </ul>
	</div>
    </div>
</div>
  </nav>

  <div class="container">

      <div class="row">

	  <div class="extras hidden-xs col-sm-4 col-lg-push-8 col-md-push-8 col-sm-push-8">
              <label class="tools_label"> guidelines <span class="glyphicon glyphicon-question-sign"></span></label>
              <hr>
              <div class="guidelines_side">
		  <h1>on asking a question</h1>
		  <p>In this section you can post a question to ask the Newton's Apple community. We value relevant questions above all, so any question is subject of the vote system and filtered therein.</p>
		  <p>We highly encourage browsing thoroughly through our database of questions before posting. Someone else may have posted it before!</p>
		  <p>If all research has failed and you still need an answer, please follow these guidelines on posting a question:</p>
		  <ul class="well">
		      <li>Don't spam our topics with questions.</li>
		      <li>Don't ask for votes.</li>
		      <li>Don't post inappropriate content, links, or images.</li>
		      <li>Be concise, but thorough.</li>
		      <li>Be relevant and helpful.</li>
		      <li><strong>Be open to any answer, but settle for the best.</strong></li>
		  </ul>
              </div>
              <hr>
	  </div>

	  <div class="ask_area col-sm-8 col-lg-pull-4 col-md-pull-4 col-sm-pull-4">
			<h1 class="hidden-lg hidden-md hidden-sm">Ask a Question</h1>

			<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/questions/" method="post" id="form-ask">
				<input name="question-user-id" type="hidden" value="<?php echo $_smarty_tpl->tpl_vars['USERID']->value;?>
" >
        	  	<div class="form-group well">
          	      	<label for="question_header_title" class="col-2 col-form-label">Your Question</label>
          	      	<textarea name="question-title" class="form-control" rows="1" id="question_header_title" placeholder="enter your question here"></textarea>
          	      	<hr>
          	      	<label for="question_header_contents" class="col-2 col-form-label">More Information (optional)</label>
          	      	<textarea name="question-description" class="form-control" rows="5" id="question_header_contents" placeholder="provide context for your question"></textarea>
        	  	</div>
        	  	<div class="well pick_topic">
          	      	<div class="form-group">
            		  	<label >Topic:</label>
						<select name="question-topic" class="form-control">
        <?php  $_smarty_tpl->tpl_vars['topic'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['topic']->_loop = false;
        $_from = $_smarty_tpl->tpl_vars['topics']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');
        }
        foreach ($_from as $_smarty_tpl->tpl_vars['topic']->key => $_smarty_tpl->tpl_vars['topic']->value) {
            $_smarty_tpl->tpl_vars['topic']->_loop = true;
        ?>
              		      	<option value="<?php echo $_smarty_tpl->tpl_vars['topic']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['topic']->value['topicname'];?>
</option>
        <?php } ?>
            		  	</select>
          	      	</div>
        	  	</div>
        	  	<div class="well pick_tags">
          	      	<label>Pick tags (optional):</label>
          	      	<textarea name="question-tags" class="form-control" rows="1" placeholder="enter your tags, separated by commas"></textarea>
        	  	</div>
	      	</form>

       		<div class="text-right"><button class="btn" type="submit" form="form-ask" value="Submit">Submit Question</button></div>

			<div class="buffer_area"></div>
	  </div>
      </div>

  </div>

    <?php echo $_smarty_tpl->getSubTemplate('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
<?php }
} ?>
