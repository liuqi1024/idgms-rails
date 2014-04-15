# 正式补号数据生成

class PatchProductController < ApplicationController
  before_filter :find_patch
  
  def patch_generate
    # 调用外部程序 ...
    
    @patch.update_attribute(:progress, 1)
    result = '补号数据生成成功.'
    redirect_to(patch_path(@patch, :result => result))
  end
  
  def print_generate
    # 调用外部程序 ...
    
    @patch.update_attribute(:progress, 2)
    result = 'print generate is success.'
    redirect_to(patch_path(@patch, :result => result))
  end
  
  def print_detect
    # 调用外部程序 ...
    
    @patch.update_attribute(:progress, 3)
    result = 'print detect is success.'
    redirect_to(patch_path(@patch, :result => result))
  end
  
  def upload
    # 调用外部程序 ...
    
    @patch.update_attribute(:progress, 4)
    result = 'upload is success.'
    redirect_to(patch_path(@patch, :result => result))
  end
  
  
  private
  
  def find_patch
    @patch = Patch.find(params[:id])
  end
end
