class ProductBatch < ActiveRecord::Base
  belongs_to :worksheet
  belongs_to :game
  attr_protected false
  has_many :transport_batches, :class_name => "TransportBatch", :foreign_key => "product_batch_id"
  has_many :patches, :class_name => "Patch", :foreign_key => "product_batch_id"
  
  STATES = { normal: '生产中', initial: '待审核', reject: '被驳回', error: '出错', delist: '已完成' }
  
  PROGRESS = { '生成数据' => 1, '数据检测' => 2, '生成印刷数据' => 3 , '印刷数据检测' => 4, '上传生产数据' => 5 }
  
  PROGRESS_TEST = { '生成数据' => 1, '生成印刷数据' => 2 , '印刷数据检测' => 3 }
  
  PROGRESS_SAMPLE = { '生成数据' => 1, '生成印刷数据' => 2 , '印刷数据检测' => 3 }
  
  NATION_CODE = %w(35 36 37)
  
  def complete?
    return false if self.print_unit_totals.blank?
    return self.print_unit_totals == self.print_unit_completes
  end
  
end
