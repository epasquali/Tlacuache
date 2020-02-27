class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable, 
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

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




  def self.from_omniauth(auth)
    if self.where(email: auth.info.email).exists?
      return_user = self.where(email: auth.info.email).first
      return_user.provider = auth.provider
      return_user.uid = auth.uid
    else
      return_user = self.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.firstname = auth.info.first_name   # assuming the user model has a name
        user.lastname = auth.info.last_name # assuming the user model has an image
        user.confirm
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
        user.skip_confirmation!
      end
    end
    return_user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.google_oauth2"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
             
end
