class AddImagesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |i|
      i.string :title
      i.string :description
      i.integer :user_id
      i.timestamps
  end

  def up
    add_attachment :images, :avatar
  end

  def down
    remove_attachment :images, :avatar
  end

  end
end
