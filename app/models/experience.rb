# == Schema Information
#
# Table name: experiences
#
#  id           :integer          not null, primary key
#  person_id    :integer
#  micropost_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Experience < ActiveRecord::Base
  belongs_to :person, class_name: "Person"
  belongs_to :micropost, class_name: "Micropost"
end
