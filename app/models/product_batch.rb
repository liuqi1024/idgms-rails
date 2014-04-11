class ProductBatch < ActiveRecord::Base
  belongs_to :worksheet
  belongs_to :game
  attr_protected false
  
  STATES = { normal: '生产中', initial: '待审核', reject: '被驳回', error: '出错', delist: '已完成' }
  
end
