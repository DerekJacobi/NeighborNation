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
#  aptnumber       :integer
#  city            :string
#  state           :string
#  zip             :integer
#  aboutme         :string
#  recommandations :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
