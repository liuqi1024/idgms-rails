class PatchesController < ApplicationController
  # GET /patches
  # GET /patches.json
  def index
    @patches = Patch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patches }
    end
  end

  # GET /patches/1
  # GET /patches/1.json
  def show
    @patch = Patch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patch }
    end
  end

  # GET /patches/new
  # GET /patches/new.json
  def new
    @patch = Patch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patch }
    end
  end

  # GET /patches/1/edit
  def edit
    @patch = Patch.find(params[:id])
  end

  # POST /patches
  # POST /patches.json
  def create
    @prodcut_batch = ProductBatch.find(params[:product_batch_id])
    @patch = Patch.new
    @patch.product_batch = @prodcut_batch
    @patch.ticket_count = 10000
    @patch.code = SecureRandom.random_number(10**6)
    array = Array.new
    5.times {array << rand(10)}
    @patch.pack_no_totals = array.to_s

    respond_to do |format|
      if @patch.save
        format.html { redirect_to @prodcut_batch, notice: 'Patch was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /patches/1
  # PUT /patches/1.json
  def update
    @patch = Patch.find(params[:id])

    respond_to do |format|
      if @patch.update_attributes(params[:patch])
        format.html { redirect_to @patch, notice: 'Patch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patches/1
  # DELETE /patches/1.json
  def destroy
    @patch = Patch.find(params[:id])
    @patch.destroy

    respond_to do |format|
      format.html { redirect_to patches_url }
      format.json { head :no_content }
    end
  end
end
