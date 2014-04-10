class WorksheetsController < ApplicationController
  load_and_authorize_resource class: 'Worksheet'
  
  # GET /worksheets
  # GET /worksheets.json
  def index
    @state = params[:state].blank?? 'normal':params[:state]
    @worksheets = Worksheet.where(state: @state)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @worksheets }
    end
  end

  # GET /worksheets/1
  # GET /worksheets/1.json
  def show
    @worksheet = Worksheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @worksheet }
    end
  end

  # GET /worksheets/new
  # GET /worksheets/new.json
  def new
    @worksheet = Worksheet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @worksheet }
    end
  end

  # GET /worksheets/1/edit
  def edit
    @worksheet = Worksheet.find(params[:id])
  end

  # POST /worksheets
  # POST /worksheets.json
  def create
    @worksheet = Worksheet.new(params[:worksheet])
    @worksheet.state = 'initial'
    
    #根据印刷单元的数量和game的参数配置，算出总的票数
    print_unit_count = @worksheet.print_unit_count
    @game = @worksheet.game
    @worksheet.ticket_count = @game.poolcount_per_printunit * @game.pool_size * print_unit_count

    respond_to do |format|
      if @worksheet.save
        format.html { redirect_to @worksheet, notice: 'Worksheet was successfully created.' }
        format.json { render json: @worksheet, status: :created, location: @worksheet }
      else
        format.html { render action: "new" }
        format.json { render json: @worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /worksheets/1
  # PUT /worksheets/1.json
  def update
    @worksheet = Worksheet.find(params[:id])

    respond_to do |format|
      if @worksheet.update_attributes(params[:worksheet])
        format.html { redirect_to @worksheet, notice: 'Worksheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worksheets/1
  # DELETE /worksheets/1.json
  def destroy
    @worksheet = Worksheet.find(params[:id])
    @worksheet.destroy

    respond_to do |format|
      format.html { redirect_to worksheets_url }
      format.json { head :no_content }
    end
  end
  
  # 确认工作单完成
  def complete
    @worksheet = Worksheet.find params[:id]
    @worksheet.state = 'delist'
    
    @worksheet.save!
    redirect_to worksheets_url
  end
end








