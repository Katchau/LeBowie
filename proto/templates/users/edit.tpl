{include file='common/header.tpl'}
{include file='common/scriptlist.tpl'}

<div class="container">
    <div class="row edit_prof">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form enctype="multipart/form-data" action="{$BASE_URL}actions/users/edit.php" method="post" role="form" class="register well text-center">
                <h2>Update your Newton's Apple account</h2>
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
					<div class="col-xs-12 col-sm-12 col-md-12">
						<input type="file" name="userfile" id="userfile" accept="image/*">
					</div>
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <textarea name="description" rows="4" cols="100" class="form-control input-lg" placeholder="Description"></textarea>
                        </div>
                    </div>
                </div>

                <hr class="colorgraph">
                <div class="row">
                    <div class="col-xs-12 col-md-12"><input type="submit" name="submited" value="Update" class="btn btn-primary btn-block btn-lg btn-warning" tabindex="7"></div>
                </div>

                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-xs-12 col-md-6">
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </form>
        </div>
    </div>
</div>

{include file='common/footer.tpl'}
