class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  scopify
  # attr_accessible :title, :body
  
  has_many :role_operations
  has_many :operations, :through => :role_operations
  
  def operation?(o)
    self.operations.collect(&:name).include?(o)
  end
end
