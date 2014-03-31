class GameProgram < ActiveRecord::Base
  belongs_to :game
  attr_accessible :version
end
