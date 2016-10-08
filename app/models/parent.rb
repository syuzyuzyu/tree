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

class Parent < Gene
end
