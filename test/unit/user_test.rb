require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "that the default list is created when a user is" do
    user = FactoryGirl.create :user
    assert_not_nil user.lists.first
    assert_not_nil user.lists.default
    assert user.default_list_empty?
  end
end
