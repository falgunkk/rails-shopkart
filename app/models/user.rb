# user model for storing user informations
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #has_many :items

  enum role: [:customer, :vendor, :owner]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    email="#{auth.info.name}" + "@fbcom"
    user.email   = email.downcase.split.join
    user.password = Devise.friendly_token[0,20]
    user.uid = auth.uid
    user.role = "customer"
    user.username = auth.info.name  
    user.save!
  end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end


