require "rspec"

describe given a gitub project name do

  it "should retrieve information about the project" do

require 'net/http'

    url = URI.parse('http://github.com/api/v2/yaml/user/show/schacon')
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts res.body
    

    #To change this template use File | Settings | File Templates.
    true.should == false
  end
end