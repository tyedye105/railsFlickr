class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: '300X300', thumb: '100X100' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :images
  validates :name, :presence => true
  validates :username, :presence => true
end
