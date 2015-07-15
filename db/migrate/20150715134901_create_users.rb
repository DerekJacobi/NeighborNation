class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.string :street
      t.integer :aptnumber
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
