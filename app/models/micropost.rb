# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :text
#  image      :string
#  delete_flg :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Micropost < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    has_many :followed_experiences, class_name: "Experience", 
                                    foreign_key: "micropost_id", 
                                    dependent: :destroy
    has_many :following_people, through: :followed_experiences, source: :person
end
