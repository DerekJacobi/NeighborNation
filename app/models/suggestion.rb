# == Schema Information
#
# Table name: suggestions
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  voting     :boolean          default(TRUE)
#

class Suggestion < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes
  belongs_to :user, class_name: "User", foreign_key: :user_id

  scope :approvals, -> { joins(:votes).where(votes: { approve: true }) }
  scope :disapprovals, -> { joins(:votes).where(votes: { approve: false }) }
  # @suggestion.approvals
  # @suggestion.approvals.count

  validates :title, presence: true
  validates :content, presence: true

  def approvals
    Suggestion.approvals.where(id: self.id)
  end

  def disapprovals
    Suggestion.disapprovals.where(id: self.id)
  end

end
