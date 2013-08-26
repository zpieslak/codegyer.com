class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :trackable
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable, :recoverable
end
