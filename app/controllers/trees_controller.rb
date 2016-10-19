class TreesController < ApplicationController
  def index
    @spouse = current_person.marriages.where(end: nil).order(start: :desc).first.spouse
    @parents = current_person.my_parents
    @children = current_person.my_children.order(birth_date: :asc)
  end
end
