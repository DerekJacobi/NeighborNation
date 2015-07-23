class Comment < ActiveRecord::Base
  belongs_to :forum, class_name: "Forum", foreign_key: :forum_id
  belongs_to :author, class_name:"User", foreign_key: :user_id

  validates :content, presence: true
end
