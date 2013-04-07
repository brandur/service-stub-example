class Web < Sinatra::Base
  post "/endpoints" do
    api = Excon.new(ENV["ION_URL"])
    response = api.post(path: "/endpoints", expects: [201, 422])
    content_type(:json)
    if response.status == 201
      [200, response.body]
    else
      [422, MultiJson.encode({ error: "Error from backend." })]
    end
  end
end
