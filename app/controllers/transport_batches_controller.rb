class TransportBatchesController < ApplicationController
  # GET /transport_batches
  # GET /transport_batches.json
  def index
    @transport_batches = TransportBatch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transport_batches }
    end
  end

  # GET /transport_batches/1
  # GET /transport_batches/1.json
  def show
    @transport_batch = TransportBatch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transport_batch }
    end
  end

  # GET /transport_batches/new
  # GET /transport_batches/new.json
  def new
    @transport_batch = TransportBatch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transport_batch }
    end
  end

  # GET /transport_batches/1/edit
  def edit
    @transport_batch = TransportBatch.find(params[:id])
  end

  # POST /transport_batches
  # POST /transport_batches.json
  def create
    # @transport_batch = TransportBatch.new(params[:transport_batch])
    @prodcut_batch = ProductBatch.find(params[:product_batch_id])
    @transport_batch = TransportBatch.new
    @transport_batch.product_batch = @prodcut_batch
    @transport_batch.start_pool_no = 100
    @transport_batch.end_pool_no = 300
    @transport_batch.code = SecureRandom.random_number(10**6)
    array = Array.new
    3.times {array << rand(10)}
    @transport_batch.print_unit_completes = array.to_s
    @transport_batch.state = 'initial'

    respond_to do |format|
      if @transport_batch.save
        Feed.create owner_type: "transport_batch", owner_id: @transport_batch.id, user_id: current_user.id, operation: "create", 
              desc: "获取运输批次文件"
        format.html { redirect_to @prodcut_batch, notice: 'Transport batch was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /transport_batches/1
  # PUT /transport_batches/1.json
  def update
    @transport_batch = TransportBatch.find(params[:id])

    respond_to do |format|
      # if @transport_batch.update_attributes(params[:transport_batch])
      if @transport_batch.update_attributes :state => "delist"
        Feed.create owner_type: "transport_batch", owner_id: @transport_batch.id, user_id: current_user.id, operation: "update", 
              desc: "生成兑奖文件"
        format.html { redirect_to @transport_batch.product_batch, notice: '成功生成兑奖文件.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transport_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transport_batches/1
  # DELETE /transport_batches/1.json
  def destroy
    @transport_batch = TransportBatch.find(params[:id])
    @transport_batch.destroy

    respond_to do |format|
      format.html { redirect_to transport_batches_url }
      format.json { head :no_content }
    end
  end
end
