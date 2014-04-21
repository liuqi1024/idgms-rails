class ProductBatchesController < ApplicationController
  # GET /product_batches
  # GET /product_batches.json
  def index
    @state = params[:state].blank?? 'normal':params[:state]
    @product_batches = ProductBatch.where(state: @state)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_batches }
    end
  end

  # GET /product_batches/1
  # GET /product_batches/1.json
  def show
    @product_batch = ProductBatch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_batch }
    end
  end

  # GET /product_batches/new
  # GET /product_batches/new.json
  def new
    @product_batch = ProductBatch.new
    unless params[:worksheet_id].blank?
      @worksheet = Worksheet.find(params[:worksheet_id])
      @product_batch.worksheet = @worksheet
    end
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_batch }
    end
  end

  # GET /product_batches/1/edit
  def edit
    @product_batch = ProductBatch.find(params[:id])
  end

  # POST /product_batches
  # POST /product_batches.json
  def create
    @product_batch = ProductBatch.new(params[:product_batch])
    worksheet = Worksheet.find(params[:product_batch][:worksheet_id])
    
    game = worksheet.game
    @product_batch.state = 'initial'
    @product_batch.game = game
    
    #根据印刷单元的数量和game的参数配置，算出总的票数
    print_unit_count = params[:product_batch][:print_unit_count]
    @product_batch.ticket_count = game.poolcount_per_printunit * game.pool_size * print_unit_count.to_i

    respond_to do |format|
      if @product_batch.save
        Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "create", desc: "创建生产批次"
        format.html { redirect_to @product_batch, notice: 'Product batch was successfully created.' }
        format.json { render json: @product_batch, status: :created, location: @product_batch }
      else
        format.html { render action: "new" }
        format.json { render json: @product_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_batches/1
  # PUT /product_batches/1.json
  def update
    @product_batch = ProductBatch.find(params[:id])
    if @product_batch.state == 'reject'
      @product_batch.state = 'initial'
    end

    respond_to do |format|
      if @product_batch.update_attributes(params[:product_batch])
        format.html { redirect_to @product_batch, notice: 'Product batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_batches/1
  # DELETE /product_batches/1.json
  def destroy
    @product_batch = ProductBatch.find(params[:id])
    @product_batch.destroy

    respond_to do |format|
      format.html { redirect_to product_batches_url }
      format.json { head :no_content }
    end
  end
end
