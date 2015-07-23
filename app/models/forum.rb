# == Schema Information
#
# Table name: forums
#
#  id         :integer          not null, primary key
#  topic      :string
#  content    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  forum_type :string
#

class Forum < ActiveRecord::Base
  validates :forum_type, inclusion: { in: ['announcement', 'classified', 'request'] }

  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: "User", foreign_key: :user_id
end
