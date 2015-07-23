class ReferenceUserToForums < ActiveRecord::Migration
  def change
    remove_column :forums, :user_id, :integer
    add_reference :forums, :user, index: true
    add_foreign_key :forums, :users
  end
end
