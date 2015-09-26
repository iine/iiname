require "test_helper"

class WelcomeRouteTest < ActionDispatch::IntegrationTest
  def test_welcome
    assert_routing "/", :controller => "suggestions", :action => "index"
  end
end