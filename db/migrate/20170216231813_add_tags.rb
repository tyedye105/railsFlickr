class AddTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.integer :image_id
      t.integer :user_id
    end
  end
end
