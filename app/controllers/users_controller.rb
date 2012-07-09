class UsersController < ApplicationController
   
  def show  
    @us=User.find(params[:id])
  end

  def edit_profile
    if request.get?
      @us=User.find(params[:id])
    else
      @us = User.update(params[:id], params[:user])
      redirect_to "/users/show/#{@us.id}"
    end
  end
  
  def pass_change

    @us = current_user
    if request.put?
      if @us.valid_password? params[:user][:old_password]
        if params[:user][:password] == params[:user][:password_confirmation]
          @us.password = params[:user][:password]
          if @us.save
            puts "================="
            puts "coming in same"
            flash[:notice] = "Password changed successfully!!!"
            redirect_to root_path
          else
            puts "================="
            puts @us.errors.inspect
            flash[:error] = 'Unable to change your password'
          end
        end
      end
    end
  end

  def index

    puts "==================="

    puts current_user.friendships.inspect

    users = []
    users << current_user.id
    users << current_user.friendships.map(&:friend_id)
    users.flatten!
    @users = User.where(["id NOT IN (?)",(users)])
  end

  def add
    current_user.friendships.build(:user_id => current_user.id, :friend_id => params[:friend_id])
    current_user.save
    
    respond_to do |format|
      format.js
    end    
  end

end
  



