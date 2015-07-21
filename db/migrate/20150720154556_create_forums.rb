class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :topic
      t.string :content
      t.integer :user_id
      t.string :type

      t.timestamps null: false
    end
  end
end
