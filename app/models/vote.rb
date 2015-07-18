class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User", foreign_key: :user_id
  belongs_to :suggestion
end
