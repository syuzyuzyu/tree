# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  image       :string
#  first_name  :string
#  last_name   :string
#  birth_date  :date
#  dead        :date
#  gender      :integer
#  birth_place :string
#  city        :string
#  cuntry      :string
#  summary     :text
#  occupation  :string
#  delete_flg  :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
