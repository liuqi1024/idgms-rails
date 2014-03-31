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
    @transport_batch = TransportBatch.new(params[:transport_batch])

    respond_to do |format|
      if @transport_batch.save
        format.html { redirect_to @transport_batch, notice: 'Transport batch was successfully created.' }
        format.json { render json: @transport_batch, status: :created, location: @transport_batch }
      else
        format.html { render action: "new" }
        format.json { render json: @transport_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transport_batches/1
  # PUT /transport_batches/1.json
  def update
    @transport_batch = TransportBatch.find(params[:id])

    respond_to do |format|
      if @transport_batch.update_attributes(params[:transport_batch])
        format.html { redirect_to @transport_batch, notice: 'Transport batch was successfully updated.' }
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
