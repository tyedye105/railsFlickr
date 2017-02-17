class Image < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_attached_file :avatar, styles: { medium: '300X300', thumb: '100X100' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :title, presence: :true
  validates :description, presence: :true
  validates :avatar, attachment_presence: :true

end
