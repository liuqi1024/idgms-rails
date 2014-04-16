class GamesController < ApplicationController
  load_and_authorize_resource class: 'Game'
  
  # GET /games
  # GET /games.json
  def index
    @state = params[:state].blank?? 'normal':params[:state]
    @games = Game.where(state: @state)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])
    
    @game.par_value = 10
    @game.sub_gamesize = 600000
    @game.pool_size = 120000
    @game.pack_size = 60
    @game.packs_per_pool = 2000
    @game.packs_per_carton = 50
    @game.first_ticket_no = 0
    @game.first_pack_no = 1
    @game.first_pool_no = 1
    @game.current_pack_no = @game.first_pack_no
    @game.poolcount_per_printunit = 5
    
    @game.state = 'initial'
    
    if @game.save
      redirect_to upload_game_url(@game)
    end
  end
  
  # 上传程序
  def upload
    @game = Game.find params[:id]

  end
  
  # 部署程序
  def deploy
    @game = Game.find params[:id]
    # @game.state = 'initial' if @game.game_programs.blank?
    if @game.version.blank?
      @game.version = 1
    else
      @game.version = params[:game][:version] unless params[:game][:version].blank?
    end
    
    @game.save!
    @game_program = GameProgram.new
    @game_program.game = @game
    @game_program.version = @game.version
    @game_program.save!
    
    redirect_to :controller => "games", :action => "show", :id => @game
  end
  
  # 导入配置文件信息
  def import
    
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end



