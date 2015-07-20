# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  suggestion_id :integer
#  approve       :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User", foreign_key: :user_id
  belongs_to :suggestion
end
