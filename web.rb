class Web < Sinatra::Base
  post "/endpoints" do
    api = Excon.new(ENV["ION_URL"])
    response = api.post(path: "/endpoints", expects: 201)
    content_type(:json)
    response.body
  end
end
