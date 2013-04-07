ENV["ION_URL"] = "https://ion.heroku.com"
ENV["RACK_ENV"] = "test"

require 'bundler/setup'
Bundler.require(:default, :test)

require "minitest/spec"
require "minitest/autorun"

require_relative "../web"
require_relative "../service_stubs/ion_stub"
require_relative "service_stubs"

describe Web do
  include Rack::Test::Methods

  def app
    Web
  end

  before do
    stub_ion
  end

  it "creates an endpoint" do
    post "/endpoints"
    assert_equal 200, last_response.status
  end

  it "fails gracefully" do
    stub_ion do
      post("/endpoints") { 422 }
    end

    post "/endpoints"
    assert_equal 422, last_response.status
  end
end
