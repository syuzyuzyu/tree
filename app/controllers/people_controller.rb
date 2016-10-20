class PeopleController < ApplicationController
  def new
    @person = Person.new
    @type = type_param
  end
  
  def create
    debugger
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
    elsif type == "parent" || type == "child"
      @person = add_family(type) 
      if current_person.save
        redirect_to trees_path
      end
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :birth_date,
                                 :gender, :birth_place, :city, :cuntry, :summary)
  end
  
  def add_spouse
    Person.transaction do
      @person = current_person.my_spouses.build(person_params)
       Marriage.transaction do
          @person.save!
          marriage = current_person.marriages.build(person_id: current_person.id, spouse_id: @person.id, start: params[:start])#TODO marriageのinputCheck
          marriage.save!
       end
    end
    redirect_to trees_path
    rescue => e
    render text: e.message
  end
  
  def add_family(type)
    case type
    when "parent" then 
      current_person.my_parents.build(person_params)
    when "child" then "child"
      current_person.my_children.build(person_params)
    #when "spouse" then "spouse"
     # current_person.marriaged.build(person_params)
    else
      new Person
    end
  end
  
  def type_param
    case params[:type]
    when "parent" then "parent"
    when "child" then "child"
    when "spouse" then "spouse"
    else
      ""
    end

    #params.fetch(:article, {}).permit(:headline, :content)
  end
  
end
