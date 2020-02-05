class Listing < ApplicationRecord
  
  has_one_attached :image

  before_validation :set_expirydate, on: :create
 
  validates :type, type_check: true
  validates :expires, expiration_date: true
  validates :title, presence: true, length: {maximum:50}
  validates :description, presence: true, length:{minimum: 40}

  def self.listing_types
    %w(Buy Sell)
  end

  protected
    def set_expirydate
      self.expires = Date.today() + 14.days
    end

end
  
