require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	def setup
		@user = User.new(name: "ValidName")
	end

	test "invalid info" do
		get signup_path
		assert_no_difference 'User.count' do
			post signup_path, params: { user: { name: "   " } }
		end
	end

	test "valid info" do
		get signup_path
		assert_difference 'User.count', 1 do
			post signup_path, params: { user: { name: @user.name } }
		end
    follow_redirect!
    assert_template 'users/show'
	end
end
