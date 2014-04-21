class AuditWorksheetsController < ApplicationController
  load_and_authorize_resource class: 'Worksheet'
  
  def index
    @worksheets = Worksheet.where(state: 'initial')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @worksheets }
    end
  end
  
  def show
    @worksheet = Worksheet.find params[:id]
    
  end
  
  def audit
    @worksheet = Worksheet.find params[:id]
    result = params[:commit]
    if result == '通过'
      @worksheet.state = 'normal'
      Feed.create owner_type: "worksheet", owner_id: @worksheet.id, user_id: current_user.id, operation: "audit", desc: "审核工作单 - 通过" 
    elsif result == '驳回'
      @worksheet.state = 'reject'
      @worksheet.desc = params[:worksheet][:desc]
      Feed.create owner_type: "worksheet", owner_id: @worksheet.id, user_id: current_user.id, operation: "audit", desc: "审核工作单 - 驳回" 
    end
    
    @worksheet.save!
    redirect_to audit_worksheets_url
  end
end
