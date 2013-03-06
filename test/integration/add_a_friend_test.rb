require 'test_helper'

class AddAFriendTest < ActionDispatch::IntegrationTest
  
  test "taht adding a friend works" do
  	def sign_in_as(user, password)
  		post login_path, user: { email: user.email, password: password }
   end
  
  test "that adding a friend works" do
  	sign_in_as users(:brandon), "testing"

  	get "/user_friendships/new?friend_id=#{users(:brandon).profile_name}"
  	assert_response :success

  	assert_diference 'user_friendship.count' do
  		post "/user_friendships", user_friendship: { friend_id: users(:jim).profile_name }
  		assert_response :redirect
  		assert_equal "You are not friends with #{users(:jim).full_name}", flash[:success]
  	end
  end
end
end
