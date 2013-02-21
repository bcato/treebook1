require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a freindship works without raising an exception" do 
	  assert_nothing_raised do
		UserFriendship.create user: users(:brandon), friend: users(:mike)
	end

	test "that creating a friendship based on user id and friend id works" do
		UserFriendship.create user_id: users(:brandon).id, friend_id: users(:mike).id
		assert users(:brandon).friends.include?(users(:mike))
  end
  end
end
