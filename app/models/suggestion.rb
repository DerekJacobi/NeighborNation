class Suggestion < ActiveRecord::Base
  has_many :votes
  has_many :voters, through: :votes

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