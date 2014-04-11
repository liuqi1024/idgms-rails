class Worksheet < ActiveRecord::Base
  belongs_to :game
  attr_protected false
  
  STATES = { normal: '生产中', initial: '待审核', reject: '被驳回', delist: '已完成' }
  
  def name_with_game
    self.game.name + ' - ' + self.code
  end
  
end
