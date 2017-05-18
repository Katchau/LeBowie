<?php /* Smarty version Smarty-3.1.15, created on 2017-04-19 19:01:20
         compiled from "/opt/lbaw/lbaw1651/public_html/proto/templates/user/profile.tpl" */ ?>
<?php /*%%SmartyHeaderCode:172084787858f7803e7da3d7-77489899%%*/if(!defined('SMARTY_DIR')) { exit('no direct access allowed'); 
}
$_valid = $_smarty_tpl->decodeProperties(
    array (
    'file_dependency' => 
    array (
    '1361b599c8d9e60621861eba4a2aeff33cea4ca4' => 
    array (
      0 => '/opt/lbaw/lbaw1651/public_html/proto/templates/user/profile.tpl',
      1 => 1492624860,
      2 => 'file',
    ),
    ),
    'nocache_hash' => '172084787858f7803e7da3d7-77489899',
    'function' => 
    array (
    ),
    'version' => 'Smarty-3.1.15',
    'unifunc' => 'content_58f7803e9869c9_99797206',
    'variables' => 
    array (
    'user' => 0,
    'BASE_URL' => 0,
    'topics' => 0,
    'value' => 0,
    'topic' => 0,
    'questions' => 0,
    'question' => 0,
    'answers' => 0,
    'answer' => 0,
    ),
    'has_nocache_code' => false,
    ), false
); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58f7803e9869c9_99797206')) {function content_58f7803e9869c9_99797206($_smarty_tpl) 
    {
?><?php echo $_smarty_tpl->getSubTemplate('common/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate('common/scriptlist.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

	
	<!-- profile area -->
    <div class="container profile">
      <div class="row">

        <div class="hidden-xs col-lg-8 media">
          <div class="profile-upper">
            <div class="profile-image-and-info">
                <?php if ($_smarty_tpl->tpl_vars['user']->value['image']==null) {?>
			  <img class="user_profile_pic2 img-thumbnail" src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/profile.png" alt="user_image">
                <?php } else { ?>
			  <img class="user_profile_pic2 img-thumbnail" src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/<?php echo $_smarty_tpl->tpl_vars['user']->value['id'];?>
/<?php echo $_smarty_tpl->tpl_vars['user']->value['image'];?>
 alt="user_image">
                <?php }?>
              <hr>
              <div class="profile-info">
                <span class="info-start">Email: </span><?php echo $_smarty_tpl->tpl_vars['user']->value['email'];?>

                <br>
                <span class="info-start">Name: </span><?php echo $_smarty_tpl->tpl_vars['user']->value['first_name'];?>

                <br>
                <span class="info-start">Surname: </span><?php echo $_smarty_tpl->tpl_vars['user']->value['last_name'];?>

                <br>
                <span class="info-start">Country: </span><?php echo $_smarty_tpl->tpl_vars['user']->value['name'];?>

                <hr>
                <div class="profile-badges">
                  <span class="info-start">User Badges </span>
                  <br>
                  <span class="label label-default">2 years club</span>
                  <span class="label label-primary">200 questions</span>
                  <br>
                  <span class="label label-success">400 answers</span>
                  <span class="label label-info"><?php echo $_smarty_tpl->tpl_vars['user']->value['score'];?>
 user score </span>
                </div>
              </div>
              <hr>
              <div class="profile-down">
                <div class="profile-topics">
                  <label class="info-start">Most frequented topics</label> <br>
                  <ul class="">
        <?php $_smarty_tpl->tpl_vars["value"] = new Smarty_variable(0, null, 0);?>
        <?php  $_smarty_tpl->tpl_vars['topic'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['topic']->_loop = false;
        $_from = $_smarty_tpl->tpl_vars['topics']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');
        }
        foreach ($_from as $_smarty_tpl->tpl_vars['topic']->key => $_smarty_tpl->tpl_vars['topic']->value) {
            $_smarty_tpl->tpl_vars['topic']->_loop = true;
        ?>
                <?php $_smarty_tpl->tpl_vars["value"] = new Smarty_variable($_smarty_tpl->tpl_vars['value']->value+1, null, 0);?>
                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/topic/list.php?id=<?php echo $_smarty_tpl->tpl_vars['topic']->value['topic_id'];?>
">
        <?php echo $_smarty_tpl->tpl_vars['topic']->value['topicname'];?>

					</a></li>
        <?php if ($_smarty_tpl->tpl_vars['value']->value==4) {?>
        <?php break 1?>
        <?php }?>
        <?php } ?>
                  </ul>
                </div>

              </div>
            </div>

            <div class="profile-user-and-desc">
              <div class="media-body profile-username">
                <?php echo $_smarty_tpl->tpl_vars['user']->value['username'];?>

              </div>
              <div class="profile-user-score">
                <span class="user_score"> <?php echo $_smarty_tpl->tpl_vars['user']->value['score'];?>
 </span> user score
              </div>
              <hr>
              <div class="profile-desc">
        <?php if ($_smarty_tpl->tpl_vars['user']->value['description']==null) {?>
			  This user hasn't added a description!
        <?php } else { ?>
        <?php echo $_smarty_tpl->tpl_vars['user']->value['description'];?>

        <?php }?>
              </div>
            </div>
          </div>

        </div>

        <div class="container hidden-sm hidden-md hidden-lg mobile_profile">
          <div class="profile-user-and-desc">
            <div class="row">
              <div class="col-xs-8">
                <div class="media-body profile-username">
                    <?php echo $_smarty_tpl->tpl_vars['user']->value['username'];?>

                </div>
                <div class="profile-user-score">
                  <span class="user_score"> <?php echo $_smarty_tpl->tpl_vars['user']->value['score'];?>
 </span> user score
                </div>
              </div>
              <div class="col-xs-4 text-right">
                <?php if ($_smarty_tpl->tpl_vars['user']->value['image']==null) {?>
			  <img class="user_profile_pic2 img-thumbnail" src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/profile.png" alt="user_image">
                <?php } else { ?>
			  <img class="user_profile_pic2 img-thumbnail" src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
img/<?php echo $_smarty_tpl->tpl_vars['user']->value['id'];?>
/<?php echo $_smarty_tpl->tpl_vars['user']->value['image'];?>
 alt="user_image">
                <?php }?>
              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-xs-12 profile-info">
                <span class="info-start">Email: </span><?php echo $_smarty_tpl->tpl_vars['user']->value['email'];?>

                <br>
                <span class="info-start">Name: </span><?php echo $_smarty_tpl->tpl_vars['user']->value['first_name'];?>

                <br>
                <span class="info-start">Surname: </span><?php echo $_smarty_tpl->tpl_vars['user']->value['last_name'];?>

                <br>
                <span class="info-start">Country: </span><?php echo $_smarty_tpl->tpl_vars['user']->value['name'];?>

              </div>
            </div>

            <hr>

            <div class="row">
              <div class="col-xs-12 profile-desc">
                Prism letterpress farm-to-table, food truck butcher seitan tilde tacos glossier affogato activated charcoal kombucha dreamcatcher. Copper mug wayfarers tumeric snackwave normcore, freegan kitsch organic humblebrag kickstarter hella quinoa skateboard. Jean shorts ethical pug, fashion axe wayfarers trust fund YOLO man bun live-edge af brunch mumblecore fam actually thundercats. Master cleanse VHS pork belly, flannel live-edge glossier man bun. Aesthetic celiac you probably haven't heard of them.

                <hr>
              </div>
            </div>

            <div class="row">
              <div class="col-xs-6 profile-badges">
                <span class="info-start">User Badges </span>
                <br>
                <span class="label label-default">2 years club</span>
                <span class="label label-primary">200 questions</span>
                <br>
                <span class="label label-success">400 answers</span>
                <span class="label label-info"><?php echo $_smarty_tpl->tpl_vars['user']->value['score'];?>
 </span>
              </div>
              <div class="col-xs-6 profile-topics">
                <label class="info-start">Most frequented topics</label> <br>
                <ul class="">
                    <?php $_smarty_tpl->tpl_vars["value"] = new Smarty_variable(0, null, 0);?>
        <?php  $_smarty_tpl->tpl_vars['topic'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['topic']->_loop = false;
        $_from = $_smarty_tpl->tpl_vars['topics']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');
        }
        foreach ($_from as $_smarty_tpl->tpl_vars['topic']->key => $_smarty_tpl->tpl_vars['topic']->value) {
            $_smarty_tpl->tpl_vars['topic']->_loop = true;
        ?>
                <?php $_smarty_tpl->tpl_vars["value"] = new Smarty_variable($_smarty_tpl->tpl_vars['value']->value+1, null, 0);?>
                    <li><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/topic/list.php?id=<?php echo $_smarty_tpl->tpl_vars['topic']->value['topic_id'];?>
">
        <?php echo $_smarty_tpl->tpl_vars['topic']->value['topicname'];?>

					</a></li>
        <?php if ($_smarty_tpl->tpl_vars['value']->value==4) {?>
        <?php break 1?>
        <?php }?>
        <?php } ?>
                </ul>
              </div>
            </div>

          </div>

            <hr>
        </div>

        <div class="col-lg-4 container-fluid profile-q-and-a">
          <div class="extras_suggested">
            <label class="related_label"> Submitted Questions </label>
            <ul class="list-group" >
                <?php $_smarty_tpl->tpl_vars["value"] = new Smarty_variable(0, null, 0);?>
        <?php  $_smarty_tpl->tpl_vars['question'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['question']->_loop = false;
        $_from = $_smarty_tpl->tpl_vars['questions']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');
        }
        foreach ($_from as $_smarty_tpl->tpl_vars['question']->key => $_smarty_tpl->tpl_vars['question']->value) {
            $_smarty_tpl->tpl_vars['question']->_loop = true;
        ?>
                <?php $_smarty_tpl->tpl_vars["value"] = new Smarty_variable($_smarty_tpl->tpl_vars['value']->value+1, null, 0);?>
			  <li><a class="list-group-item suggestion" href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/questions/index.php?id=<?php echo $_smarty_tpl->tpl_vars['question']->value['post_id'];?>
">
        <?php echo substr($_smarty_tpl->tpl_vars['question']->value['title'], 0, 200);?>

			  <span class="badge"><?php echo $_smarty_tpl->tpl_vars['question']->value['up_score'];?>
</span>
			  </a></li>
        <?php if ($_smarty_tpl->tpl_vars['value']->value==4) {?>
        <?php break 1?>
        <?php }?>
        <?php } ?>
            </ul>
          </div>
          <hr>
          <div class="extras_suggested">
            <label class="related_label"> Submitted Answers </label>
            <ul class="list-group" >
                <?php $_smarty_tpl->tpl_vars["value"] = new Smarty_variable(0, null, 0);?>
        <?php  $_smarty_tpl->tpl_vars['answer'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['answer']->_loop = false;
        $_from = $_smarty_tpl->tpl_vars['answers']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');
        }
        foreach ($_from as $_smarty_tpl->tpl_vars['answer']->key => $_smarty_tpl->tpl_vars['answer']->value) {
            $_smarty_tpl->tpl_vars['answer']->_loop = true;
        ?>
                <?php $_smarty_tpl->tpl_vars["value"] = new Smarty_variable($_smarty_tpl->tpl_vars['value']->value+1, null, 0);?>
			  <li><a class="list-group-item suggestion" href="#">
        <?php echo substr($_smarty_tpl->tpl_vars['answer']->value['description'], 0, 200);?>

			  </a>
			  <span class="badge"><?php echo $_smarty_tpl->tpl_vars['answer']->value['up_score'];?>
</span></li>
        <?php if ($_smarty_tpl->tpl_vars['value']->value==3) {?>
        <?php break 1?>
        <?php }?>
        <?php } ?>
            </ul>
          </div>
          <hr>

        </div>
      </div>
    </div>
	
    <?php echo $_smarty_tpl->getSubTemplate('common/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>
<?php }
} ?>
