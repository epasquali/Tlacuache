class Listing < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  #before_validation :set_expirydate, on: :create

  validates :user_id, presence: true
  validates :type, type_check: true
  validates :expires, expiration_date: true
  validates :title, presence: true, length: {maximum:50}
  validates :description, presence: true, length:{minimum: 40}

  default_scope -> {order(created_at: :desc)}

  def self.listing_types
    %w(Buy Sell)
  end


  def owned_by?(user)
    self.user_id == (user.try(:id) || user)
  end


  def set_expirydate
    self.expires = Date.today() + 14.days
  end

end
  
