class Listing < ApplicationRecord
  
  has_one_attached :image
 
  validates :type, type_check: true
  validates :expires, expiration_date: true
  validates :title, presence: true, length: {maximum:50}
  validates :description, presence: true, length:{minimum: 40}

  def self.listing_types
    %w(Buy Sell)
  end

end

