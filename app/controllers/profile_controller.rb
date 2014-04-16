class ProfileController < ApplicationController
  
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
      redirect_to edit_profile_url(@user), notice: 'User was successfully updated.' 
    else
      render action: "edit"
    end
  end
end
