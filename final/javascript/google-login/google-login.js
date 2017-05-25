function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();

    document.getElementById('google-signin-email').value = profile.getEmail();
    document.getElementById('google-signin-first-name').value = profile.getGivenName();
    document.getElementById('google-signin-last-name').value = profile.getFamilyName();
    document.getElementById('google-signin-image').value = profile.getImageUrl();

    document.getElementById('google-signin').submit();
}

function signOut() {
    gapi.load('auth2', function () {
        gapi.auth2.init().then(function () {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut().then(function () {
                console.log('User signed out.');
                window.location.href = `${BASE_URL}actions/users/logout.php`;
            });
        });
    });
}
