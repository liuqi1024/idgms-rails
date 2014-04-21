class Game < ActiveRecord::Base
  attr_accessible :code, :completed_at, :desc, :name, :status, :version
  
  has_many :worksheets
  has_many :game_programs, :class_name => "GameProgram", :foreign_key => "game_id"
  
  STATES = { normal: '上市', initial: '待审核', reject: '被驳回', delist: '退市' }
  
  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  
  after_create :feed_create
  
  def current_game_program
    return GameProgram.where(version: self.version).first
  end
  
  def feed_create
    Feed.create owner_type: "game", owner_id: self.id, user_id: self.creator_id, operation: "create", desc: "创建游戏"
  end
end
