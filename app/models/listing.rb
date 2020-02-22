class Listing < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  validates :user_id, presence: true
  validates :type, type_check: true
  validates :expires, expiration_date: true
  validates :title, presence: true, length: {maximum:50}
  validates :description, presence: true, length:{minimum: 40}
  validates :city, length: {maximum: 100}
  validates :state, length: {maximum: 50}
  validates :country, length: {maximum: 100}
  validates :image, content_type: {in: %w[image/jpeg image/gif image/png], message: :wrongimgformat},
                                  size: {less_than: 10.megabytes, message: :imagetoobig}

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
  
