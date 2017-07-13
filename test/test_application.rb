# rulers/test/test_application.rb
# require_relative just means “require,
# but check from this fileʼs directory, not the load path”
# ruby test/test_application.rb
require_relative "test_helper"

class TestController < Rulers::Controller
  def index
    "Hello!" # Not rendering a view
  end
end

class HomeController < Rulers::Controller
  def index
    "Hello!" # Not rendering a view
  end
end

class TestApp < Rulers::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods
  def app
    TestApp.new
  end
  def test_request
    get "/example/route"
    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  def request_home_page
    get "/"
    assert last_response.ok?
    body = last_response.body
    assert body["This is the Home Page"]
  end

end