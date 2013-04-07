def stub_service(uri, stub, &block)
  uri = URI.parse(uri)
  port = uri.port != uri.default_port ? ":#{uri.port}" : ""
  stub = block ? Sinatra.new(stub, &block) : stub
  stub_request(:any, /^#{uri.scheme}:\/\/(.*:.*@)?#{uri.host}#{port}\/.*$/).
    to_rack(stub)
end

def stub_ion(&block)
  stub_service(ENV["ION_URL"], IonStub, &block)
end
