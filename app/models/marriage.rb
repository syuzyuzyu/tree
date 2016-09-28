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

class Marriage < ActiveRecord::Base
  belongs_to :person, class_name: "Person"
  belongs_to :spouse, class_name: "Person"
end
