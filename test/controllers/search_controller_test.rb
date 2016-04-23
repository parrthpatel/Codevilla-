require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get repository" do
    get :repository
    assert_response :success
  end

  test "should get articles" do
    get :articles
    assert_response :success
  end

end
