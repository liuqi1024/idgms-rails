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
    elsif result == '驳回'
      @worksheet.state = 'reject'
      @worksheet.desc = params[:worksheet][:desc]
    end
    
    @worksheet.save!
    redirect_to audit_worksheets_url
  end
end
