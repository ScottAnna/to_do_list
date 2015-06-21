require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
