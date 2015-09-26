require "test_helper"

class WelcomeRouteTest < ActionDispatch::IntegrationTest
  def test_welcome
    assert_routing "/", :controller => "welcome", :action => "index"
  end
end