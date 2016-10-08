# == Schema Information
#
# Table name: genes
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  bond_id    :integer
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gene < ActiveRecord::Base
  belongs_to :person, class_name: "Person"
  belongs_to :bond, class_name: "Person"
end
