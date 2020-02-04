require 'test_helper'

class ListingTest < ActiveSupport::TestCase
 

  setup do
    @buylisting = listings(:buy)
    @selllisting = listings(:sell)
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



end

