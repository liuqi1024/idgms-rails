class DataTestController < ApplicationController
  before_filter :find_product_batch
  
  def data_generate
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress_test, 1)
    Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "data_test", 
          desc: "测试数据 - 生成程序"
    result = 'data generate is success.'
    redirect_to(product_batch_path(@product_batch, :result_test => result))
  end
  
  def print_generate
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress_test, 2)
    Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "data_test", 
          desc: "测试数据 - 生成印刷程序"
    result = 'print generate is success.'
    redirect_to(product_batch_path(@product_batch, :result_test => result))
  end
  
  def print_detect
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress_test, 3)
    Feed.create owner_type: "product_batch", owner_id: @product_batch.id, user_id: current_user.id, operation: "data_test", 
          desc: "测试数据 - 印刷程序检测"
    result = 'print detect is success.'
    redirect_to(product_batch_path(@product_batch, :result_test => result))
  end
  
  private
  
  def find_product_batch
    @product_batch = ProductBatch.find(params[:id])
  end
end
