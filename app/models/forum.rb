class Forum < ActiveRecord::Base
  validates :forum_type, inclusion: { in: ['classified', 'request'] }

  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: "User", foreign_key: :user_id
end
