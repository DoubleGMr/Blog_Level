require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@user = users(:michael)
  	@post = @user.posts.build(title:"Lorem",content: "Lorem ipsum",publish: true)
  end

  test "should be valid" do
  	assert @post.valid?
  end

  test "user id should be present" do
  	@post.user_id = nil
  	assert_not @post.valid?
  end

  test "title should be present" do
  	@post.title = " "
  	assert_not @post.valid?
  end

  test "content should be present" do
  	@post.content = " "
  	assert_not @post.valid?
  end

  test "order should be most recent first" do
	assert_equal posts(:most_recent), Post.first
  end

end
