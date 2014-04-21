class Patch < ActiveRecord::Base
  belongs_to :product_batch
  # attr_accessible :code, :pack_no_totals, :ticket_count
  attr_protected false
  
  STATES = { initial: '未使用', delist: '已完成' }
  
  PROGRESS = { '生成数据' => 1,  '生成印刷数据' => 2 , '印刷数据检测' => 3, '上传生产数据' => 4 }
  
  PROGRESS_TEST = { '生成数据' => 1, '生成印刷数据' => 2 , '印刷数据检测' => 3 }
end
