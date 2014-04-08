class AuditGamesController < ApplicationController
  load_and_authorize_resource class: 'Game'
  
  def index
    @games = Game.where(state: 'initial')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end
  
  def show
    @game = Game.find params[:id]
    
  end
  
  def audit
    @game = Game.find params[:id]
    result = params[:commit]
    if result == '通过'
      @game.state = 'normal'
    elsif result == '驳回'
      @game.state = 'reject'
      @game.desc = params[:game][:desc]
    end
    
    @game.save!
    redirect_to audit_games_url
  end
end
