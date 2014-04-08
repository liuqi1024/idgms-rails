class Operation < ActiveRecord::Base
  attr_accessible :desc, :name
  
  has_many :role_operations
  has_many :roles, :through => :role_operations
  
  OPERATONS = %w{ 游戏部署 游戏审核 用户管理 角色管理 游戏管理 工作单管理 生产批次管理 印厂管理 系统管理 数据重现 生产数据 生产补号 测试数据 测试补号 }
  
end
