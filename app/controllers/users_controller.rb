class UsersController < ApplicationController

  def index
    @users = User.all
    
  end
  
  def new
    @user = User.new
    
  end
  
  def create
    @user = User.new(params[:user])
    @user.save!
    redirect_to users_url, notice: 'User was successfully created.' 
  end
  
  def edit
    @user = User.find(params[:id])
    
  end
  
  def update
    @user = User.find(params[:id])
    
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.update_attributes(params[:user])
      redirect_to users_url, notice: 'User was successfully updated.' 
    else
      render action: "edit"
    end
  end
  
  def destroy
    @user = User.find params[:id]
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
