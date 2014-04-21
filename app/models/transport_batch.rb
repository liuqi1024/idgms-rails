class TransportBatch < ActiveRecord::Base
  belongs_to :product_batch
  # attr_accessible :code
  attr_protected false
  
  STATES = { initial: '未使用', delist: '已完成' }
end
