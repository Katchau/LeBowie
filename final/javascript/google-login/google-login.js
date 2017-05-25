let credentials = {
    apiKey = 'AIzaSyBEns6eMAJ0KUf9DckGX_80FnhyyRcSC2g',
    discoveryDocs = ["https://people.googleapis.com/$discovery/rest?version=v1"],
    clientId = '368853933346-n6sheti6h9gnvhrl28hflukm3ussbjiq.apps.googleusercontent.com',
    scopes = 'profile'
}

let button = document.getElementById('google-login-button');

function handleClientLoad() {
    gapi.load('client:auth2', initClient);
}

function initClient() {
    gapi.client.init(credentials).then(function() {
        gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);
        updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());

        button.onclick = handleAuthClick();
    });
}

function updateSigninStatus() {
    if (isSignedIn) {
        makeApiCall();
    }
}

function handleAuthClick(event) {
    gapi.auth2.getAuthInstance().signIn();
}

function makeApiCall() {
    gapi.client.people.people.get({
       'resourceName': 'people.me',
       'requestMask.includeField': 'person.names'
    }).then(function(resp) {
        console.log(resp.result.names[0].givenName);
    });
}