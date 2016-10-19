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

class Person < ActiveRecord::Base
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :experiences, class_name: "Experience", 
                                    foreign_key: "person_id", 
                                    dependent: :destroy
    has_many :following_microposts, through: :experiences, source: :micropost
    
    
    has_many :marriages, class_name: "Marriage", 
                                    foreign_key: "person_id", 
                                    dependent: :destroy
    has_many :my_spouses, through: :marriages, source: :spouse
    
    has_many :marriaged, class_name: "Marriage", 
                                    foreign_key: "spouse_id", 
                                    dependent: :destroy
    has_many :followed_spouses, through: :marriaged, source: :person
    
    
    has_many :genes, class_name: "Gene", foreign_key: "person_id", dependent: :destroy
    has_many :my_family, through: :genes, source: :bond
    
    has_many :parents, class_name: "Parent", 
                                    foreign_key: "person_id", 
                                    dependent: :destroy
    has_many :my_parents, through: :parents, source: :bond
    
    has_many :children, class_name: "Child", 
                                    foreign_key: "person_id", 
                                    dependent: :destroy
    has_many :my_children, through: :children, source: :bond
    
    def share(micropost)
        experiences.create(micropost_id: micropost.id)
    end
end
