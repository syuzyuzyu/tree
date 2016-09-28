# == Schema Information
#
# Table name: genes
#
#  id            :integer          not null, primary key
#  person_id     :integer
#  connection_id :integer
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class GeneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
