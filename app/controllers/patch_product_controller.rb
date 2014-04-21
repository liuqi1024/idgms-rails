# 正式补号数据生成

class PatchProductController < ApplicationController
  before_filter :find_patch
  
  def patch_generate
    # 调用外部程序 ...
    
    @patch.update_attribute(:progress, 1)
    Feed.create owner_type: "patch", owner_id: @patch.id, user_id: current_user.id, operation: "patch_product", 
          desc: "补号数据 - 生成程序"
    result = '补号数据生成成功.'
    redirect_to(patch_path(@patch, :result => result))
  end
  
  def print_generate
    # 调用外部程序 ...
    
    @patch.update_attribute(:progress, 2)
    Feed.create owner_type: "patch", owner_id: @patch.id, user_id: current_user.id, operation: "patch_product", 
          desc: "补号数据 - 生成印刷数据"
    result = 'print generate is success.'
    redirect_to(patch_path(@patch, :result => result))
  end
  
  def print_detect
    # 调用外部程序 ...
    
    @patch.update_attribute(:progress, 3)
    Feed.create owner_type: "patch", owner_id: @patch.id, user_id: current_user.id, operation: "patch_product", 
          desc: "补号数据 - 印刷数据检测"
    result = 'print detect is success.'
    redirect_to(patch_path(@patch, :result => result))
  end
  
  def upload
    # 调用外部程序 ...
    
    @patch.update_attributes(:progress => 4, :state => 'delist')
    Feed.create owner_type: "patch", owner_id: @patch.id, user_id: current_user.id, operation: "patch_product", 
          desc: "补号数据 - 上传生产数据"
    result = 'upload is success.'
    redirect_to(patch_path(@patch, :result => result))
  end
  
  
  private
  
  def find_patch
    @patch = Patch.find(params[:id])
  end
end
