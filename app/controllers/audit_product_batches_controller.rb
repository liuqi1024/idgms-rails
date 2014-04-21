class AuditProductBatchesController < ApplicationController
  def index
    @product_batches = ProductBatch.where(state: 'initial')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_batches }
    end
  end

  def show
    @product_batch = ProductBatch.find params[:id]
    
  end
  
  def audit
    @product_batch = ProductBatch.find params[:id]
    result = params[:commit]
    if result == '通过'
      @product_batch.state = 'normal'
      Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "audit", desc: "审核生产批次 - 通过"
    elsif result == '驳回'
      @product_batch.state = 'reject'
      @product_batch.desc = params[:product_batch][:desc]
      Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "audit", desc: "审核生产批次 - 驳回"
    end
    
    @product_batch.save!
    redirect_to audit_product_batches_url
  end
end
