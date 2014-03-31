class Worksheet < ActiveRecord::Base
  belongs_to :game
  attr_accessible :completed_at, :desc, :printbatch
end
