class Contactmsg
  include ActiveModel::Model
  attr_accessor :name, :email, :message

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence:true, length: {in: 3..255}
  validates :email, presence:true, length: {maximum:255},
             format: {with: VALID_EMAIL_REGEX}
  validates :message, presence: true


end