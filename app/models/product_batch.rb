class ProductBatch < ActiveRecord::Base
  belongs_to :worksheet
  attr_accessible :code
end
