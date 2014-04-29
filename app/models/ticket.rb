class Ticket < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_group
  attr_protected false
  
  GENERATE_YTPE = %w(text graph)
  
  STATES = { commit: '待审核', initial: '创建', reject: '被驳回', delist: '已通过' }
end
