class TransportBatch < ActiveRecord::Base
  belongs_to :product_batch
  attr_accessible :code
  
  STATES = { initial: '未使用', delist: '已完成' }
end
