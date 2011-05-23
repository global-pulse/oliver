require "test/unit"
require 'net/http'
require 'yaml'

class GithubTests < Test::Unit::TestCase
  def test_can_read_project_info
    url = URI.parse('http://github.com/api/v2/yaml/user/show/global-pulse')
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    info = YAML.load(res.body)

    assert_equal("global-pulse", info["user"]["login"])
  end

  def test_can_read_repo_info
    url = URI.parse('http://github.com/api/v2/yaml/repos/show/global-pulse/oliver')
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    info = YAML.load(res.body)

    assert_equal("oliver", info["repository"][:name])
  end
end