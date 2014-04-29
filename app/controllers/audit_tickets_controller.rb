class AuditTicketsController < ApplicationController
  def index
    @tickets = Ticket.where(state: 'commit')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end
  
  def show
    @ticket = Ticket.find params[:id]
    
  end
  
  def audit
    @ticket = Ticket.find params[:id]
    result = params[:commit]
    if result == '通过'
      @ticket.state = 'delist'
      Feed.create owner_type: "ticket", owner_id: @ticket.id, user_id: current_user.id, operation: "audit", desc: "审核工作单 - 通过" 
    elsif result == '驳回'
      @ticket.state = 'reject'
      @ticket.desc = params[:ticket][:desc]
      Feed.create owner_type: "ticket", owner_id: @ticket.id, user_id: current_user.id, operation: "audit", desc: "审核工作单 - 驳回" 
    end
    
    @ticket.save!
    redirect_to audit_tickets_url
  end
end
