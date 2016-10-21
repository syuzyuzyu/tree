class PeopleController < ApplicationController
  def new
    @person = Person.new
    @type = type_param
  end
  
  def create

    type = params[:type]

    #  Person.transaction do
    #    @person = current_person.marriaged.build(person_params)
    #    @person.save!
    #    Marriage.transaction do
    #      @person.save!
    #      marriage = current_person.marriages.build(person_id: current_person.id, spouse_id: @person.id, start: params[:start])#TODO marriageのinputCheck
    #      marriage.save!
    #    end
    #  end
    #  render 'new'
    #  rescue => e
    #    render 'new'
    if type == "spouse" 
      add_spouse
    elsif type == "parent"
      add_parent
    elsif type == "child"
      add_child
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params)
      # 更新に成功したときの処理
      render 'edit'
    else
      render 'edit'
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def destroy
    Person.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to tree_path(tree_person.id)
  end
  
  
  
  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :birth_date,
                                 :gender, :birth_place, :city, :cuntry, :summary)
  end
  
  def add_spouse
    Person.transaction do
      person = tree_person.my_spouses.build(person_params)
       Marriage.transaction do
          person.save!
          #marriage = tree_person.marriages.build(person_id: tree_person.id, spouse_id: @person.id, start: params[:start])#TODO marriageのinputCheck
          #marriage.save!
          tree_person.marriages.build(person_id: tree_person.id, spouse_id: person.id, start: params[:start])
          tree_person.save!
          person.marriages.build(person_id: person.id, spouse_id: tree_person.id, start: params[:start])
          person.save!
       end
    end
    redirect_to tree_path(tree_person.id)
    rescue => e
    render text: e.message
  end
  
  def add_parent
    Person.transaction do
      person = tree_person.my_parents.build(person_params)
      tree_person.save!
      person.children.build(person_id: person.id, bond_id: tree_person.id)
      person.save!
    end
    redirect_to tree_path(tree_person.id)
    rescue => e
    render text: e.message
  end
  
  def add_child
    Person.transaction do
      person = tree_person.my_children.build(person_params)
      tree_person.save!
      person.parents.build(person_id: person.id, bond_id: tree_person.id)
      person.save!
      if spouse?(tree_person)
        spouse = tree_person.marriages.where(end: nil).order(start: :desc).first.spouse
        spouse.children.build(person_id: spouse.id, bond_id: person.id)
        spouse.save!
        person.parents.build(person_id: person.id, bond_id: spouse.id)
        person.save!
      end
    end
    redirect_to tree_path(tree_person.id)
    rescue => e
    render text: e.message
  end
  
  def type_param
    case params[:type]
    when "parent" then "parent"
    when "child" then "child"
    when "spouse" then "spouse"
    else
      ""
    end
  end
  
end
