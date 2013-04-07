require "multi_json"
require "sinatra/base"

class IonStub < Sinatra::Base
  post "/endpoints" do
    status 201
    content_type :json
    MultiJson.encode({
      id:           123,
      cname:        "tokyo-1234.herokussl.com",
      elb_dns_name: "elb016353-1923944129.us-east-1.elb.amazonaws.com",
    })
  end
end

if __FILE__ == $0
  $stdout.sync = $stderr.sync = true
  IonStub.run! port: 5100
end
