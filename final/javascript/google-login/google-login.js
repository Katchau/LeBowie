function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();

    document.getElementById('google-signin-email').value = profile.getEmail();
    document.getElementById('google-signin-first-name').value = profile.getGivenName();
    document.getElementById('google-signin-last-name').value = profile.getFamilyName();
    document.getElementById('google-signin-image').value = profile.getImageUrl();

    document.getElementById('google-signin').submit();
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
}

function onLoad() {
    gapi.load('auth2,signin2', function () {
        var auth2 = gapi.auth2.init();
        auth2.then(function () {
            // Current values
            var isSignedIn = auth2.isSignedIn.get();
            var currentUser = auth2.currentUser.get();

            if (!isSignedIn) {
                // Rendering g-signin2 button.
                gapi.signin2.render('google-signin-button', {
                    'onsuccess': 'onSignIn'
                });
            }
        });
    });
}
