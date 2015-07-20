class AddTypeToForum < ActiveRecord::Migration
  def change
    add_column :forums, :forum_type, :string
  end
end
