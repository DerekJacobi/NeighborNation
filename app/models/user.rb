# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  firstname       :string
#  lastname        :string
#  email           :string
#  password_digest :string
#  street          :string
#  aptnumber       :string
#  city            :string
#  state           :string
#  zip             :integer
#  aboutme         :string           default("Click here to tell your neighbors a little about yourself")
#  recommandations :string           default("Click here to recommend some local hotspots to your neighbors")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :suggestions
  has_many :forums

  has_many :votes
  has_many :voted_suggestions, through: :votes, source: :suggestion

  validates :email, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  validates :password_digest, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :street, presence: true
  validates :aptnumber, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true


end
