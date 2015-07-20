class Forum < ActiveRecord::Base
  validates :forum_type, inclusion: { in: ['classified', 'request'] }
end
