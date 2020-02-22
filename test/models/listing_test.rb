require 'test_helper'

class ListingTest < ActiveSupport::TestCase
 

  setup do
    @user = users(:ben)
    #@buylisting = listings(:buy)
    #@selllisting = listings(:sell)
    #@buylisting.user_id = @user.id
    #@selllisting.user_id = @user.id
    @buylisting = @user.listings.create(title: "Buy title", description: "Buy description"*5, type: "Buy", expires: Date.today() + 14.days())
    @selllisting = @user.listings.build(title: "Sell title", description: "Sell description"*5, type: "Sell", expires: Date.today() + 14.days())
  end


  test 'listing should be valid' do
    assert @buylisting.valid?
  end

  test 'buy listing is valid' do
    assert @buylisting.valid?
  end

  test 'sell listing is valid' do
    assert @selllisting.valid?
  end

  test 'user id should be present' do
    @buylisting.user_id = nil
    assert_not @buylisting.valid?
  end

  test 'type should be present' do
    @buylisting.type = ''
    assert_not @buylisting.valid?
  end

  test 'listing type should be buy or sell' do
    @buylisting.type = "Blue"
    assert_not @buylisting.valid?
  end

  test 'listing should have a title' do
    @buylisting.title = ''
    assert_not @buylisting.valid?
  end

  test 'listing title should not be too long' do
    @buylisting.title = "a"*51
    assert_not @buylisting.valid?
  end

  test 'listing should have a description' do
    @buylisting.description = ''
    assert_not @buylisting.valid?
  end

  test 'listing description should not be too short' do
    @buylisting.description = 'a'*39
    assert_not @buylisting.valid?
  end

  test 'expiry date must be present' do
    @buylisting.expires = ''
    assert_not @buylisting.valid?
  end

  test "expiry must be a date" do
    @buylisting.expires = "nana"
    assert_not @buylisting.valid?
  end

  test "expiry date cannot be in the past" do
    @buylisting.expires = Date.parse ("Jan 1 2000")
    assert_not @buylisting.valid?
  end

  #test "order should be most recent first" do
  #  assert_equal listing(:most_recent), Listing.first
  #end


end

