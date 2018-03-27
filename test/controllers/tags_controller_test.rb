require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get new" do
    log_in_as(@user)
    get new_tag_path
    assert_response :success
  end

  test "shouldn't get new without admin" do
    log_in_as(@other_user)
    get new_tag_path
    assert_redirected_to root_url
  end

end
