class ProductBatchesController < ApplicationController
  # GET /product_batches
  # GET /product_batches.json
  def index
    @product_batches = ProductBatch.all

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

    respond_to do |format|
      if @product_batch.save
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
