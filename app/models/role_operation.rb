class RoleOperation < ActiveRecord::Base
  attr_accessible :operation_id, :role_id
  
  belongs_to :role
  belongs_to :operation
end
