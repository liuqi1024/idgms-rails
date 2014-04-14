class DataProductController < ApplicationController
  
  before_filter :find_product_batch
  
  def data_generate
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress, 1)
    result = 'data generate is success.'
    redirect_to(product_batch_path(@product_batch, :result => result))
  end
  
  def data_detect
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress, 2)
    result = 'data detect is success.'
    redirect_to(product_batch_path(@product_batch, :result => result))
  end
  
  def print_generate
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress, 3)
    result = 'print generate is success.'
    redirect_to(product_batch_path(@product_batch, :result => result))
  end
  
  def print_detect
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress, 4)
    result = 'print detect is success.'
    redirect_to(product_batch_path(@product_batch, :result => result))
  end
  
  def upload
    # 调用外部程序 ...
    
    @product_batch.update_attribute(:progress, 5)
    result = 'upload is success.'
    redirect_to(product_batch_path(@product_batch, :result => result))
  end
  
  
  private
  
  def find_product_batch
    @product_batch = ProductBatch.find(params[:id])
  end
  
end
