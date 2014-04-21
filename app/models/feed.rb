class Feed < ActiveRecord::Base
  attr_accessible :desc, :operation, :owner_id, :owner_type, :user_id
  
  belongs_to :user
  
  OWNER_TYPE = { game: '游戏', worksheet: '工作单', product_batch: '生产批次', transport_batch: '运输批次', patch: '补号文件', ticket: '数据重现', user: '用户', role: "权限", system: "系统功能" }
end
