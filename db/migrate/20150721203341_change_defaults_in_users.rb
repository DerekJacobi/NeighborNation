class ChangeDefaultsInUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :aboutme, ""
    change_column_default :users, :recommandations, ""
  end
end
