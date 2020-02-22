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

  test "user should have firstname" do
    @user.firstname = ''
    assert_not @user.valid?
  end

  test "user firstname should not be too long" do
    @user.firstname = "a"*51
    assert_not @user.valid?
  end

  test "user should have lastname" do
    @user.lastname = ''
    assert_not @user.valid?
  end

  test "user lastname should not be too long" do
    @user.firstname = "a"*51
    assert_not @user.valid?
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

  test "user delete should destroy all user listings" do
    @user.save
    @user.listings.create!(title: "Test Listing", description: "Description here"*5, 
                           type: "Sell", expires: Date.today() + 14.days)
    assert_difference 'Listing.count', -1 do
      @user.destroy
    end
  end


end
