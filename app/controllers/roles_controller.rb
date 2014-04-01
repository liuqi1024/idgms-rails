class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end
  
  def create
    @role = Role.new(params[:role])
    if @role.save
      redirect_to roles_url, notice: 'Ticket was successfully created.' 
    end
    
  end
  
  def show
    @role = Role.find params[:id]
  end
  
  def destroy
    @role = Role.find params[:id]
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end
end
