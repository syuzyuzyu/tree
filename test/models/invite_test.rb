# == Schema Information
#
# Table name: invites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class InviteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
