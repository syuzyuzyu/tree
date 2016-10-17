require 'test_helper'

class TreesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
