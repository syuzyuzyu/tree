require 'test_helper'

class HistoriesControllerTest < ActionController::TestCase
  def setup
    @history = histories(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'History.count' do
      post :create, history: { content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'History.count' do
      delete :destroy, id: @history
    end
    assert_redirected_to login_url
  end
  test "should redirect destroy for wrong history" do
    log_in_as(users(:michael))
    history = histories(:ants)
    assert_no_difference 'History.count' do
      delete :destroy, id: history
    end
    assert_redirected_to root_url
  end
end
