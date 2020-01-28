require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @listing = listings(:one)
    @listing.description = "MyText"*10
  end

  test 'listing should be valid' do
    assert @listing.valid?
  end

  test 'listing should have a title' do
    @listing.title = ''
    assert_not @listing.valid?
  end

  test 'listing title should not be too long' do
    @listing.title = "a"*51
    assert_not @listing.valid?
  end

  test 'listing should have a description' do
    @listing.description = ''
    assert_not @listing.valid?
  end

  test 'listing description should not be too short' do
    @listing.description = 'a'*49
    assert_not @listing.valid?
  end


end

