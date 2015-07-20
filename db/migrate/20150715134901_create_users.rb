class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.string :street
      t.string :aptnumber
      t.string :city
      t.string :state
      t.integer :zip
      t.string :aboutme, :default => 'Tell your neighbors a little about yourself.'
      t.string :recommandations, :default => 'Recommend some local hotspots to your neighbors.'

      t.timestamps null: false
    end
  end
end
