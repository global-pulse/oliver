function GitHubAPI() {
}

GitHubAPI.UserInfo = function(username, callback) {
    requestURL = "http://github.com/api/v2/json/user/show/" + username + "?callback=?";
    $.getJSON(requestURL, function(json, status) {
        callback(json, status);
    });
}

GitHubAPI.Repos = function(username, callback) {
    requestURL = "http://github.com/api/v2/json/repos/show/" + username + "?callback=?";
    $.getJSON(requestURL, function(json, status) {
        callback(json.repositories, status);
    });
}
