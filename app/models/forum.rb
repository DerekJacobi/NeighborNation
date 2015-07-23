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
  validates :forum_type, inclusion: { in: ['classified', 'request'] }
end
