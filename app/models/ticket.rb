class Ticket < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_group
  attr_accessible :ticket_no
end
