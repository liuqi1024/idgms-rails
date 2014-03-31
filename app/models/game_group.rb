class GameGroup < ActiveRecord::Base
  belongs_to :game
  attr_accessible :serial_no, :torrent
end
