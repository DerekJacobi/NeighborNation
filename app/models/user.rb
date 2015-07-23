# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  firstname          :string
#  lastname           :string
#  email              :string
#  password_digest    :string
#  street             :string
#  aptnumber          :string
#  city               :string
#  state              :string
#  zip                :integer
#  aboutme            :string           default("")
#  recommandations    :string           default("")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class User < ActiveRecord::Base
  has_secure_password


  has_many :suggestions, dependent: :destroy

  has_many :forums, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :votes, dependent: :destroy
  has_many :voted_suggestions, through: :votes, source: :suggestion

  has_attached_file :image, styles: {
    thumb: "100x100>",
    square: '200x200#',
    medium: '300x300>'
  },
  url: ':s3_domain_url',
  path: '/:class/:attachment/:id_partition/:style/:filename'


  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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
