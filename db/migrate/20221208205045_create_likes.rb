class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :logged_in_id
      t.integer :liked_id

      t.timestamps
    end
  end
end
