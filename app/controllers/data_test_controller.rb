class DataTestController < ApplicationController
  before_filter :find_product_batch
  
  def data_generate
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress_test, 1)
    result = 'data generate is success.'
    redirect_to(product_batch_path(@product_batch, :result_test => result))
  end
  
  def print_generate
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress_test, 2)
    result = 'print generate is success.'
    redirect_to(product_batch_path(@product_batch, :result_test => result))
  end
  
  def print_detect
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress_test, 3)
    result = 'print detect is success.'
    redirect_to(product_batch_path(@product_batch, :result_test => result))
  end
  
  private
  
  def find_product_batch
    @product_batch = ProductBatch.find(params[:id])
  end
end
