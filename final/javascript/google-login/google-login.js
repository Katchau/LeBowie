function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    console.log('Name: ' + profile.getName());
    console.log('Image URL: ' + profile.getImageUrl());
    console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

    document.getElementById('google-signin-email').value = profile.getEmail(); 
    document.getElementById('google-signin-first-name').value = profile.getFirstName();
    document.getElementById('google-signin-last-name').value = profile.getLastName();
    document.getElementById('google-signin-image').value = profile.getImageUrl();

    //document.getElementById('google-signin').submit();
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
}
