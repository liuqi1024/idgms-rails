class Game < ActiveRecord::Base
  attr_accessible :code, :completed_at, :desc, :name, :status, :version
  
  has_many :worksheets
  has_many :game_programs, :class_name => "GameProgram", :foreign_key => "game_id"
  
  STATES = { normal: '上市', initial: '待审核', reject: '被驳回', delist: '退市' }
  
  def current_game_program
    return GameProgram.where(version: self.version).first
  end
end
