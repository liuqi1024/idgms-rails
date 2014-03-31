class ProductUnitsController < ApplicationController
  # GET /product_units
  # GET /product_units.json
  def index
    @product_units = ProductUnit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_units }
    end
  end

  # GET /product_units/1
  # GET /product_units/1.json
  def show
    @product_unit = ProductUnit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_unit }
    end
  end

  # GET /product_units/new
  # GET /product_units/new.json
  def new
    @product_unit = ProductUnit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_unit }
    end
  end

  # GET /product_units/1/edit
  def edit
    @product_unit = ProductUnit.find(params[:id])
  end

  # POST /product_units
  # POST /product_units.json
  def create
    @product_unit = ProductUnit.new(params[:product_unit])

    respond_to do |format|
      if @product_unit.save
        format.html { redirect_to @product_unit, notice: 'Product unit was successfully created.' }
        format.json { render json: @product_unit, status: :created, location: @product_unit }
      else
        format.html { render action: "new" }
        format.json { render json: @product_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_units/1
  # PUT /product_units/1.json
  def update
    @product_unit = ProductUnit.find(params[:id])

    respond_to do |format|
      if @product_unit.update_attributes(params[:product_unit])
        format.html { redirect_to @product_unit, notice: 'Product unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_units/1
  # DELETE /product_units/1.json
  def destroy
    @product_unit = ProductUnit.find(params[:id])
    @product_unit.destroy

    respond_to do |format|
      format.html { redirect_to product_units_url }
      format.json { head :no_content }
    end
  end
end
