class GameGroupsController < ApplicationController
  # GET /game_groups
  # GET /game_groups.json
  def index
    @game_groups = GameGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @game_groups }
    end
  end

  # GET /game_groups/1
  # GET /game_groups/1.json
  def show
    @game_group = GameGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game_group }
    end
  end

  # GET /game_groups/new
  # GET /game_groups/new.json
  def new
    @game_group = GameGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game_group }
    end
  end

  # GET /game_groups/1/edit
  def edit
    @game_group = GameGroup.find(params[:id])
  end

  # POST /game_groups
  # POST /game_groups.json
  def create
    @game_group = GameGroup.new(params[:game_group])

    respond_to do |format|
      if @game_group.save
        format.html { redirect_to @game_group, notice: 'Game group was successfully created.' }
        format.json { render json: @game_group, status: :created, location: @game_group }
      else
        format.html { render action: "new" }
        format.json { render json: @game_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /game_groups/1
  # PUT /game_groups/1.json
  def update
    @game_group = GameGroup.find(params[:id])

    respond_to do |format|
      if @game_group.update_attributes(params[:game_group])
        format.html { redirect_to @game_group, notice: 'Game group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_groups/1
  # DELETE /game_groups/1.json
  def destroy
    @game_group = GameGroup.find(params[:id])
    @game_group.destroy

    respond_to do |format|
      format.html { redirect_to game_groups_url }
      format.json { head :no_content }
    end
  end
end
