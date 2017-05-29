{include file='common/header.tpl'}

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form method="post" action="{$BASE_URL}actions/users/login.php">
                <div class="form-group">
                    <input title="username" type="text" name="username" id="display_name" class="form-control input-lg" placeholder="Username/Email"
                        tabindex="3">
                </div>
                <div class="form-group">
                    <input title="password" type="password" name="password" id="password_confirmation" class="form-control input-lg" placeholder="Password"
                        tabindex="6">
                </div>
                <div><button type="submit" class="btn btn-default">Sign in</button></div>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6 col-md-6">
            {if $GOOGLE} {else}
            <form id="google-signin" method="post" action="{$BASE_URL}pages/users/signup-google.php">
                <div class="g-signin2" data-onsuccess="onSignIn"></div>
                <input id="google-signin-email" type="hidden" name="email" value="">
                <input id="google-signin-first-name" type="hidden" name="first-name" value="">
                <input id="google-signin-last-name" type="hidden" name="last-name" value="">
                <input id="google-signin-image" type="hidden" name="image" value="">
            </form>
            {/if}
        </div>
        <div class="col-lg-3"></div>
        <div class="col-md-3"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
    </div>
</div>

{include file='common/footer.tpl'}