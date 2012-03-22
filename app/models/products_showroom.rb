class ProductsShowroom < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :showroom
  
  attr_accessible :product_id, :showroom_id
  
end
