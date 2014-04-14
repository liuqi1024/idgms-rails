class Patch < ActiveRecord::Base
  belongs_to :product_batch
  attr_accessible :code, :pack_no_totals, :ticket_count
end
