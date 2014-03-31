class ProductUnit < ActiveRecord::Base
  belongs_to :game
  belongs_to :product_batch
  attr_accessible :code
end
