require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test "user should have an email" do
    @user.email = ''
    assert_not @user.valid?
  end
  

  test "emails should be proper format" do
    @user.email = 'kkkkk123.qoiuwr'
    assert_not @user.valid?
  end


  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

end
