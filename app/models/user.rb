class User < ApplicationRecord
  has_one_attached :avatar
  has_many :listings
  
  after_create :assign_default_role
  
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

end
