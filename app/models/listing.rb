class Listing < ApplicationRecord
  
  has_one_attached :image

  validates :title, presence:true, length: {maximum:50}
  validates :description, presence:true, length:{minimum: 40}

end
