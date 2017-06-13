require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Foobar")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name must not blank" do
		@user.name = "		"
		assert_not @user.valid?
	end
end
