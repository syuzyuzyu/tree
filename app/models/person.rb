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
    
    
    has_many :following_marriages, class_name: "Marriage", 
                                    foreign_key: "person_id", 
                                    dependent: :destroy
    has_many :following_spouses, through: :following_marriages, source: :spouse
    
    has_many :followed_marriages, class_name: "Marriage", 
                                    foreign_key: "spouse_id", 
                                    dependent: :destroy
    has_many :followed_spouses, through: :followed_marriages, source: :person
    
    
    has_many :genes, class_name: "Gene", foreign_key: "person_id", dependent: :destroy
    has_many :connection, through: :genes, source: :connection
    
    has_many :following_parents, class_name: "Parent", 
                                    foreign_key: "person_id", 
                                    dependent: :destroy
    has_many :my_parents, through: :following_parents, source: :connection
    
    has_many :following_children, class_name: "Child", 
                                    foreign_key: "person_id", 
                                    dependent: :destroy
    has_many :my_children, through: :following_children, source: :connection
    
    def share(micropost)
        following_experiences.create(micropost_id: micropost.id)
    end
    
    def experience(param)
        self.transaction do
            micropost = following_microposts.build(param)
            experiences.find_or_create_by(micropost_id: micropost.id)
            micropost.save!
        end
    end
end
