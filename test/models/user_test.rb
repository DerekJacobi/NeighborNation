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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
