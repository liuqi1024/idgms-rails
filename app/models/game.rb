class Game < ActiveRecord::Base
  attr_accessible :code, :completed_at, :desc, :name, :status, :version
  
  has_many :worksheets
  has_many :game_programs, :class_name => "game_program", :foreign_key => "game_id"
end
