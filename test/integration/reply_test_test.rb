require 'test_helper'

class ReplyTestTest < ActionDispatch::IntegrationTest
   def setup
  	@admin = users(:michael)
	@non_admin = users(:archer)
  end

  test "can't reply before login" do
  	post replies_path, params: { reply: { content:  'test',
										  user_id: @admin.id,
										  comment_id: 1 } }
  	assert_redirected_to login_path
  	assert_not flash.empty?
  end
end
