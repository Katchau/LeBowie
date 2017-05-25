function onSignIn(googleUser) {
    console.log("HERE");
    var profile = googleUser.getBasicProfile();
    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    console.log('Name: ' + profile.getName());
    console.log('Image URL: ' + profile.getImageUrl());
    console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

    $.post(`${BASE_URL}pages/users/signup-google.php`, {
        email: profile.getEmail(),
        first_name: profile.getGivenName(),
        last_name: profile.getFamilyName(),
        image: profile.getImageUrl()
    });
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
}
