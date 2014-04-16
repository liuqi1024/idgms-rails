class GameGroup < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_program
  
  attr_protected false
end
