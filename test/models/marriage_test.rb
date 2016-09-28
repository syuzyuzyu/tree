# == Schema Information
#
# Table name: marriages
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  spouse_id  :integer
#  start      :date
#  end        :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MarriageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
