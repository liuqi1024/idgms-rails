class DataProductController < ApplicationController
  
  before_filter :find_product_batch
  
  def data_generate
    # 调用外部程序 ...
    
    # 调用种子发生器,遍历有多少个奖组,产生gamegroup资料
    @game_group = GameGroup.new
    @game_group.game = @product_batch.game
    @game_group.game_program = @product_batch.game.current_game_program
    @game_group.torrent = 'ghajhlllgajlalgas134bvnalf'
    @game_group.serial_no = rand(10).to_s
    @game_group.code = rand(100).to_s
    @game_group.save!
    
    @product_batch.update_attribute(:progress, 1)
    Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "data_product", 
          desc: "生产数据 - 生成程序"
    result = 'data generate is success.'
    redirect_to(product_batch_path(@product_batch, :result => result))
  end
  
  def data_detect
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress, 2)
    Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "data_product", 
          desc: "生产数据 - 数据检测"
    result = 'data detect is success.'
    redirect_to(product_batch_path(@product_batch, :result => result))
  end
  
  def print_generate
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress, 3)
    Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "data_product", 
          desc: "生产数据 - 生成印刷数据"
    result = 'print generate is success.'
    redirect_to(product_batch_path(@product_batch, :result => result))
  end
  
  def print_detect
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress, 4)
    Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "data_product", 
          desc: "生产数据 - 印刷数据检测"
    result = 'print detect is success.'
    redirect_to(product_batch_path(@product_batch, :result => result))
  end
  
  def upload
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress, 5)
    Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "data_product", 
          desc: "生产数据 - 上传生产数据"
    result = 'upload is success.'
    redirect_to @product_batch, notice: '文件已经成功上传至服务器.'
  end
  
  
  private
  
  def find_product_batch
    @product_batch = ProductBatch.find(params[:id])
  end
  
end
