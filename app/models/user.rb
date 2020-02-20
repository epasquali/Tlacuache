class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable

  has_many :listings, dependent: :destroy
  
  before_save {email.downcase!}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :firstname, presence:true, length: {maximum:50}
  validates :lastname, presence:true, length: {maximum:50}

  validates :email, presence:true, length: {maximum:255},
             format: {with: VALID_EMAIL_REGEX},
             uniqueness: {case_sensitive: false}

  def update_without_password(params, *options)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
          
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
             
end
