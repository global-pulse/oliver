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

function optionalElement(tag, label, value) {
    if (value) {
        return "<" + tag + ">" + label + ": " + value + "</" + tag + ">"
    } else {
        return ""
    }
}

$(document).ready(function() {
    $("input.TestLink").click(function() {
        var username = $("#pulse_application_git_hub_repository").val();

        GitHubAPI.UserInfo(username, function(json, status) {
            var content = "";
            $.each(json, function(i) {
                content += optionalElement("li", "id", this["id"]);
                content += optionalElement("li", "login", this["login"]);
                content += optionalElement("li", "name", this["name"]);
                content += optionalElement("li", "company", this["company"]);
                content += optionalElement("li", "location", this["location"]);
                content += optionalElement("li", "email", this["email"]);
                content += optionalElement("li", "blog", this["blog"]);
                content += optionalElement("li", "Following", this["following_count"]);
                content += optionalElement("li", "followers_count", this["followers_count"]);
                content += optionalElement("li", "public_gist_count", this["public_gist_count"]);
                content += optionalElement("li", "public_repo_count", this["public_repo_count"]);
            });
            $("ul#userinfo").html(content);
        });

        GitHubAPI.Repos(username, function(json, status) {
            var content = "";
            $.each(json, function(i) {

                content += optionalElement("li", "score", this['score']);
                content += optionalElement("li", "name", this['name']);
                content += optionalElement("li", "actions", this['actions']);
                content += optionalElement("li", "size", this['size']);
                content += optionalElement("li", "language", this['language']);
                content += optionalElement("li", "followers", this['followers']);
                content += optionalElement("li", "username", this['username']);
                content += optionalElement("li", "type", this['type']);
                content += optionalElement("li", "id", this['id']);
                content += optionalElement("li", "forks", this['forks']);
                content += optionalElement("li", "fork", this['fork']);
                content += optionalElement("li", "description", this['description']);
                content += optionalElement("li", "pushed", this['pushed']);
                content += optionalElement("li", "created", this['created']);
            });
            $("ul#projects").html(content);
            $("#userinfo").show();
        })


    });
});
