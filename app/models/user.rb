class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
         
geocoded_by :location
after_validation :geocode, :if => :location_changed?
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.avatar = auth.info.image
    user.name = auth.info.name
    end
end

  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:current_password)
      self.update_without_password(params)
    else
      self.verify_password_and_update(params)
    end
  end

  def update_without_password(params={})
    params.delete(:password)
    params.delete(:password_confirmation)
    result = update_attributes(params)
    clean_up_passwords
    result
  end


end
