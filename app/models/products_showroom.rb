class ProductsShowroom < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :showroom
  
  validates :product_id, :presence => true
  validates :showroom_id, :presence => true
  
  attr_accessible :product_id, :showroom_id
  
end
