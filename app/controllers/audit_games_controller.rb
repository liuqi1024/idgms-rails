class AuditGamesController < ApplicationController
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end
  
  def show
    @game = Game.find params[:id]
    
  end
  
  def audit
    result = params[:result]
    if result == 'pass'
      puts "pass........."
      
    elsif result == 'reject'
      puts "reject........."
      
    end
    
    redirect_to audit_games_url
  end
end
