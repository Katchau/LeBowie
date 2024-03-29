{include file='common/header.tpl'}

<script src="{$BASE_URL}javascript/common/register.js"></script>
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" class="register well text-center" method="post" action="{$BASE_URL}actions/users/register.php">
				<h2>Welcome to Newton's Apple!</h2>
				<h3><small>By becoming a new member, you now can ask anything you want, our help out other people! Just complete this registration process:</small></h3>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input required type="text" name="first_name" id="first_name" class="form-control input-lg" placeholder="First Name" tabindex="1">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input required type="text" name="last_name" id="last_name" class="form-control input-lg" placeholder="Last Name" tabindex="2">
						</div>
					</div>
				</div>
				<div class="form-group">
					<input required type="text" name="display_name" id="display_name" class="form-control input-lg" placeholder="Username" tabindex="3">
				</div>
				<div class="form-group">
					<input required type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" tabindex="4">
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input required title="Password must contain at least 8 characters, 1 alphabet character and 1 number" type="password" name="password"
							 id="password" class="form-control input-lg" placeholder="Password" tabindex="5">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input required type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirm Password"
							 tabindex="6">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group date text-center" data-provide="datepicker">
							<input required type="date" class="form-control" name="birth">
						</div>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-6">

						<div class="form-group">
							<select class="form-control input-lg" name="country" required id="country_select">
  							<option selected="selected" value="">Country</option>
  							{foreach $countries as $country}
  							<option value="{$country.id}">{$country.name}</option>
  							{/foreach}
  						</select>
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
						<div class="g-signin2" data-onsuccess="onSignIn"></div>
					</div>
					<div class="col-md-3"></div>
				</div>
			</form>
		</div>
	</div>
</div>

{include file='common/footer.tpl'}