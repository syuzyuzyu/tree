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

class Gene < ActiveRecord::Base
  belongs_to :person
  belongs_to :connection
end
