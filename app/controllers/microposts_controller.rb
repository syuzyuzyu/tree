class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create]

    def create
        #http://www.rokurofire.info/2014/02/26/rails_tablerelationship/
        @micropost = current_person.following_microposts.build(micropost_params)
        if current_person.save
            flash[:success] = "Micropost created!"
            redirect_to root_url
        else
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
