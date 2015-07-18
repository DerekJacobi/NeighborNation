class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :suggestion, index: true, foreign_key: true
      t.boolean :approve

      t.timestamps null: false
    end

    add_index :votes, [:user_id, :suggestion_id], unique: true
  end
end
