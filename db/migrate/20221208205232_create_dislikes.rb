class CreateDislikes < ActiveRecord::Migration[7.0]
  def change
    create_table :dislikes do |t|
      t.integer :logged_in_id
      t.integer :disliked_id

      t.timestamps
    end
  end
end
