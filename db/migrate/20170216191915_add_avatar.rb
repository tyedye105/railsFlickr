class AddAvatar < ActiveRecord::Migration[5.0]
  def up
    add_attachment :images, :avatar
  end

  def down
    remove_attachment :images, :avatar
  end
end
