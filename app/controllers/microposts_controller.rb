class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create]

    def create
        #http://www.rokurofire.info/2014/02/26/rails_tablerelationship/
        param = micropost_params
        rollback_count = 0
        for person_id in params[:to_family]
            debugger
            person = Person.find(person_id)
            #@micropost = current_person.following_microposts.build(micropost_params)
            @micropost = person.following_microposts.build(param)
            if person.save
                flash[:success] = "Micropost created!"
                #redirect_to root_url
            else
              rollback_count += 1
            end
        end
        if rollback_count == 0
            flash[:success] = "Micropost created!"
            redirect_to root_url
        else
            flash[:success] = "Micropost uncreated!"
            redirect_to root_url
        end
    end
  
    #最初はcreateメソッドをこのように書いていた
    def sample
        #Nested Transactionってよくわからん from http://qiita.com/huydx/items/d946970d130b7dabe7ec 
        #２モデル回たら2モデルともロールバックする

        Person.transaction do
            User.transaction do
                @preson.save!
                @user.save!
            end
        end
        rescue => e
        render 'new'
        ActiveRecord::Rollback
 
        
        Person.transaction do
            @micropost = current_person.following_microposts.build(micropost_params)
            debugger
            if @micropost.save!
                #ここでcurrent_personがundefindになる why?
                current_person.experiences.find_or_create_by(micropost_id: @micropost.id)
                flash[:success] = "Micropost created!"
                redirect_to root_url
            else
              redirect_to root_url
            end
        end
    end
    
  private
  
  def micropost_params
    #params.require(:micropost).permit(:content)
    params.require(:micropost).permit(:title, :content, :image)
  end
end
