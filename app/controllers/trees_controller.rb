class TreesController < ApplicationController
  def show
    person = Person.find(params[:id])
    tree_user_in(person)
    marriage = person.marriages.where(end: nil).order(start: :desc).first #|| tree_person.marriaged.where(end: nil).order(start: :desc).first
    @spouse = marriage.spouse if !marriage.nil?  
    @parents = person.my_parents  #|| tree_person.done_my_parents
    @children = person.my_children.order(birth_date: :asc) #|| tree_person.done_my_children.order(birth_date: :asc)
  end
end
