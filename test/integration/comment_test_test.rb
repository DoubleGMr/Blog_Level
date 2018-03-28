require 'test_helper'

class CommentTestTest < ActionDispatch::IntegrationTest
  def setup
  	@admin = users(:michael)
	@non_admin = users(:archer)
  end

  test "can't comment before login" do
  	post comments_path, params: { comment: { content:  'test',
          										    user_id: @admin.id,
          										    post_id: 1 } }
  	assert_redirected_to login_path
  end
end
