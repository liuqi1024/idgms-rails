class TransportBatch < ActiveRecord::Base
  belongs_to :product_batch
  attr_accessible :code
end
