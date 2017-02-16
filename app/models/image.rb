class Image < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, styles: { medium: '300X300', thumb: '100X100' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
